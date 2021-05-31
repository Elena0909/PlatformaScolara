using PlatformaScoala.ViewModels;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System;


namespace PlatformaScoala.Models.Actions
{
    class AdminAction
    {
        ScoalaEntities bd = new ScoalaEntities();
        private AdminVM admin;
        

        public AdminAction(AdminVM admin)
        {
            this.admin = admin;
        }

        public ObservableCollection<PersoanaVM> Profi()
        {

            List<ListaProfi_Result> listaProfi = bd.ListaProfi().ToList();
            ObservableCollection<PersoanaVM> profi = new ObservableCollection<PersoanaVM>();
            foreach (ListaProfi_Result prof in listaProfi)
            {
                profi.Add(new PersoanaVM()
                {
                    CNP = prof.CNP_prof,
                    Nume = prof.Nume,
                    Prenume = prof.Prenume,
                    Username = prof.Username,
                    Parola = prof.parola,
                    Rol = prof.Rol

                });
            }
            return profi;
        }

        public ObservableCollection<PersoanaVM> NeDiriginti()
        {

            List<ListaProfi_Result> listaProfi = bd.ListaProfi().ToList();
            
            ObservableCollection<PersoanaVM> neDiriginti = new ObservableCollection<PersoanaVM>();
            foreach (ListaProfi_Result prof in listaProfi)
            {
                string cnp = bd.CnpProfNP(prof.Nume, prof.Prenume).ElementAtOrDefault(0);
                var v = bd.DiriginteCNP(cnp).ElementAtOrDefault(0);
                if (v == null)
                {
                    neDiriginti.Add(new PersoanaVM()
                    {
                        CNP = prof.CNP_prof,
                        Nume = prof.Nume,
                        Prenume = prof.Prenume,
                        Username = prof.Username,
                        Parola = prof.parola,
                        Rol = prof.Rol

                    });
                }
            }
            return neDiriginti;
        }
        public ObservableCollection<PersoanaVM> Elevi()
        {

            List<ListaElevi_Result> listaElevi = bd.ListaElevi().ToList();
            ObservableCollection<PersoanaVM> elevi = new ObservableCollection<PersoanaVM>();
            foreach (ListaElevi_Result elev in listaElevi)
            {
                elevi.Add(new PersoanaVM()
                {
                    CNP = elev.CNP_elev,
                    Nume = elev.Nume,
                    Prenume = elev.Prenume,
                    Clasa = new ClasaVM() { Clasa =elev.clasa },
                    Username = elev.Username,
                    Parola = elev.parola,
                    Rol = elev.Rol,
                });
            }
            return elevi;
        }

        public ObservableCollection<MaterieVM> Materii()
        {
            List<Materii_Result> listaMaterii = bd.Materii().ToList();
            ObservableCollection<MaterieVM> materii = new ObservableCollection<MaterieVM>();
            foreach (Materii_Result materie in listaMaterii)
            {
                if (materie.nume == null)
                    materie.nume = "-";
                if (materie.prenume == null)
                    materie.prenume = "-";
                if (materie.clasa == null)
                    materie.clasa = "-";
                materii.Add(new MaterieVM()
                {
                    Denumire = materie.denumire,
                    Prof = new PersoanaVM() { Nume = materie.nume, Prenume = materie.prenume },
                    Clasa = new ClasaVM() { Clasa = materie.clasa }
                });
            }
            return materii;
        }

        public ObservableCollection<ClasaVM> Clase()
        {
            List<Clase_Result> listaclase = bd.Clase().ToList();
            ObservableCollection<ClasaVM> clase = new ObservableCollection<ClasaVM>();
            foreach (Clase_Result clasa in listaclase)
            {
                clase.Add(new ClasaVM()
                {
                    Clasa = clasa.clasa,
                    Specializare = new SpecializareVM() { Specializare = clasa.denumire },
                    Dirig = new PersoanaVM() { Nume=clasa.nume,Prenume=clasa.prenume}
                });
            }
            return clase;
        }
        public ObservableCollection<SpecializareVM> Specializari()
        {
            List<string> listaSpecializari = bd.Specializari().ToList();
            ObservableCollection<SpecializareVM> specializari = new ObservableCollection<SpecializareVM>();
            foreach (string specializare in listaSpecializari)
            {
                specializari.Add(new SpecializareVM()
                {
                    Specializare = specializare
                });
            }
            return specializari;
        }


        public void AddPersoana(object obj)
        {
            //parametrul obj este cel dat prin CommandParameter cu MultipleBinding la Button in xaml
            PersoanaVM persoanaVM = obj as PersoanaVM;
            if (persoanaVM != null)
            {
                if (String.IsNullOrEmpty(persoanaVM.Nume) || String.IsNullOrEmpty(persoanaVM.Prenume)
                    || String.IsNullOrEmpty(persoanaVM.CNP)
                    || String.IsNullOrEmpty(persoanaVM.Username) || String.IsNullOrEmpty(persoanaVM.Parola))
                {

                    admin.Mesaj = "Toate campurile trebiue sa fie completate";
                    return;
                }
                if(persoanaVM.CNP.Length>13)
                {
                    admin.Mesaj = "Cnp-ul este prea lung!";
                    return;
                }
                string vf = bd.VfElev(persoanaVM.CNP).ElementAtOrDefault(0);
                if (vf == "1")
                {
                    admin.Mesaj = "CNP exista deja!";
                    return;
                }
                if (persoanaVM.Rol == "elev" && persoanaVM.Clasa.Clasa == "")
                {
                    admin.Mesaj = "Toate campurile trebiue sa fie completate";
                    return;
                }
                 vf = bd.VfInregistrare(persoanaVM.Username).ElementAtOrDefault(0);
                if (vf == "1")
                {
                    admin.Mesaj = "Username-ul este deja folosit";
                    return;

                }
                Nullable<int> idClasa;

                if (persoanaVM.Clasa.Clasa == "" && persoanaVM.Rol == "prof")
                    idClasa = null;
                else
                {
                    idClasa = bd.IdClasa(persoanaVM.Clasa.Clasa).ElementAtOrDefault(0);
                    if (idClasa == null)
                    {
                        admin.Mesaj = "Clasa nu exista";
                        return;
                    }
                }

                if (persoanaVM.Rol == "elev")
                {
                    bd.AddInregistrare(persoanaVM.Username, persoanaVM.Parola, persoanaVM.Rol);
                    bd.AddElev(persoanaVM.CNP, persoanaVM.Nume, persoanaVM.Prenume, persoanaVM.Username, idClasa);
                    bd.SaveChanges();
                    admin.Elevi = Elevi();
                    admin.Mesaj = "Elevul a fost adaugat";
                }
                if (persoanaVM.Rol == "prof")
                {
                    bd.AddInregistrare(persoanaVM.Username, persoanaVM.Parola, persoanaVM.Rol);
                    bd.AddProf(persoanaVM.CNP, persoanaVM.Nume, persoanaVM.Prenume, persoanaVM.Username);
                    bd.SaveChanges();
                    admin.Profi = Profi();
                    admin.Mesaj = "Profesorul a fost adaugat";
                }
            }
        }

        public void AddMaterie(object obj)
        {
            MaterieVM materie = obj as MaterieVM;
            if (materie != null)
            {
                if (materie.Denumire == String.Empty)
                {
                    admin.Mesaj = "Introduceti o materie";
                    return;
                }


                Nullable<int> id_materie;
                id_materie = bd.IdMaterie(materie.Denumire).ElementAtOrDefault(0);
                if (id_materie != null)
                {
                    admin.Mesaj = "Aceasta materie exista deja";
                    return;
                }

                string cnp_prof;
                Nullable<int> id_clasa;
                if (materie.Clasa != null && materie.Prof != null)
                {
                    id_clasa = bd.IdClasa(materie.Clasa.Clasa).ElementAtOrDefault(0);
                    if (id_clasa == null)
                    {
                        admin.Mesaj = "ceva nu a mers bine! Nu s-a gasit clasa";
                        return;
                    }
                    cnp_prof = bd.CnpProfNP(materie.Prof.Nume, materie.Prof.Prenume).ElementAtOrDefault(0);
                    if (cnp_prof == String.Empty)
                    {
                        admin.Mesaj = "Ceva nu a mers bine! Nu s-a gasit profesorul";
                        return;
                    }
                    bd.AddMaterie(materie.Denumire);
                    id_materie = bd.IdMaterie(materie.Denumire).ElementAtOrDefault(0);
                    bd.AddProfMaterie(id_materie, cnp_prof);
                    bd.AddProfMaterieClasa(id_materie, cnp_prof, id_clasa);
                    admin.Materii = Materii();
                    admin.Mesaj = "Materie adaugata cu succes";
                    return;
                }
                if (materie.Prof != null)
                {
                    cnp_prof = bd.CnpProfNP(materie.Prof.Nume, materie.Prof.Prenume).ElementAtOrDefault(0);
                    if (cnp_prof == String.Empty)
                    {
                        admin.Mesaj = "Ceva nu a mers bine! Nu s-a gasit profesorul";
                        return;
                    }
                    bd.AddMaterie(materie.Denumire);
                    id_materie = bd.IdMaterie(materie.Denumire).ElementAtOrDefault(0);
                    bd.AddProfMaterie(id_materie, cnp_prof);
                    admin.Materii = Materii();
                    admin.Mesaj = "Materie adaugata cu succes";
                    return;
                }
                bd.AddMaterie(materie.Denumire);
                admin.Materii = Materii();
                admin.Mesaj = "Materie adaugata cu succes";
                return;
            }


        }

        public void AddClasa(object obj)
        {
            ClasaVM clasa = obj as ClasaVM;
            if (clasa != null)
            {
                if (clasa.Clasa == String.Empty)
                {
                    admin.Mesaj = "Introduceti o clasa";
                    return;
                }
                if (clasa.Dirig == null)
                {
                    admin.Mesaj = "Clasa trebuie sa aiba un diriginte";
                }
                if (clasa.Specializare == null)
                {
                    admin.Mesaj = "Selectati o specializare";
                }


                Nullable<int> id_clasa;
                id_clasa = bd.IdClasa(clasa.Clasa).ElementAtOrDefault(0);
                if (id_clasa != null)
                {
                    admin.Mesaj = "Aceasta clasa exista deja";
                    return;
                }

                Nullable<int> id_specializare;



                id_specializare = bd.IdSpecializare(clasa.Specializare.Specializare).ElementAtOrDefault(0);
                if (id_specializare == null)
                {
                    admin.Mesaj = "Ceva nu a mers bine!Specializarea nu a fost gasita";
                    return;
                }
                string cnp = bd.CnpProfNP(clasa.Dirig.Nume, clasa.Dirig.Prenume).ElementAtOrDefault(0);
                if (cnp == null)
                {
                    admin.Mesaj = "Ceva nu a mers bine!SProful nu a fost gasit";
                    return;
                }
                bd.AddClasa(clasa.Clasa, cnp, id_specializare);
                bd.SaveChanges();
                admin.Clase = Clase();
                admin.NeDiriginti = NeDiriginti();
                admin.Mesaj = "Clasa adaugata cu succes";
            }
            else
                admin.Mesaj = "Clasa trebuie sa aiba un nume o specializare si un diriginte!";
        }

        public void UpdatePersoana(object obj)
        {
            PersoanaVM persoanaVM = obj as PersoanaVM;
            if (persoanaVM == null)
            {
                admin.Mesaj = "Selecteaza o persoana";
                return;
            }
            if (String.IsNullOrEmpty(persoanaVM.CNP) || String.IsNullOrEmpty(persoanaVM.Username))
            {
                admin.Mesaj = "CNP ul si  username ul trebuie mentionate!";
                return;
            }
            else
            {

                string vf = bd.VfInregistrare(persoanaVM.Username).FirstOrDefault();
                if(vf=="0")
                {
                    admin.Mesaj = "Username ul nu se poate nodifica!";
                    return;
                }
                if (persoanaVM.Rol == "elev")
                { 
                    vf = bd.VfElev(persoanaVM.CNP).ElementAtOrDefault(0); 
                    if(vf=="0")
                    {
                        admin.Mesaj = "CNP nu se poate nodifica!";
                        return;
                    }
                    Nullable<int> id_clasa = bd.IdClasa(persoanaVM.Clasa.Clasa).ElementAtOrDefault(0);
                    if(id_clasa==null)
                    {
                        admin.Mesaj = "Clasa nu exista!";
                        return;
                    }
                    bd.UpdateUser(persoanaVM.Username, persoanaVM.Parola);
                    bd.UpdateElev(persoanaVM.Nume, persoanaVM.Prenume, id_clasa, persoanaVM.CNP);
                    bd.SaveChanges();
                    admin.Mesaj = "S-a modificat cu succes!";
                }
                if (persoanaVM.Rol == "prof")
                {
                    vf = bd.VfProf(persoanaVM.CNP).ElementAtOrDefault(0);
                    if (vf == "0")
                    {
                        admin.Mesaj = "CNP nu se poate nodifica!";
                        return;
                    }
                   
                    bd.UpdateUser(persoanaVM.Username, persoanaVM.Parola);
                    bd.UpdateProf(persoanaVM.Nume, persoanaVM.Prenume, persoanaVM.CNP);
                    admin.Materii = Materii();
                    admin.Clase = Clase();
                    admin.NeDiriginti = NeDiriginti();
                    bd.SaveChanges();
                    admin.Mesaj = "S-a modificat cu succes!";
                }

            }
        }

        public void UpdateMaterie(object obj)
        {
            MaterieVM materie = obj as MaterieVM;
            if (materie != null)
            {
                if (materie.Denumire == String.Empty)
                {
                    admin.Mesaj = "Introduceti o materie";
                    return;
                }
                Nullable<int> id_materie;
                id_materie = bd.IdMaterie(materie.Denumire).ElementAtOrDefault(0);
                if (id_materie == null)
                {
                    admin.Mesaj = "Materia nu exista";
                    return;
                }
                if(materie.Prof==null)
                {
                    admin.Mesaj = "Selectati un profesor care sa predea materia";
                    return;
                }
                if (materie.Prof != null && materie.Clasa.Clasa == String.Empty)
                {
                    string cnp = bd.CnpProfNP(materie.Prof.Nume, materie.Prof.Prenume).ElementAtOrDefault(0);
                    if (bd.VfProf(cnp).ElementAtOrDefault(0) == "0")
                    {
                        admin.Mesaj = "Persoana nu a for gasita";
                        return;
                    }
                    if(bd.vfPM(cnp,id_materie).ElementAtOrDefault(0)=="1")
                    {
                        admin.Mesaj = "Aceasta legatura exista deja!";
                        return;
                    }
                    bd.AddProfMaterie(id_materie,cnp);
                    admin.Mesaj = "S-a modificat legatura!";
                    admin.Materii = Materii();
                }

                if (materie.Prof != null && materie.Clasa.Clasa != String.Empty)
                {
                    string cnp = bd.CnpProfNP(materie.Prof.Nume, materie.Prof.Prenume).ElementAtOrDefault(0);
                    if (bd.VfProf(cnp).ElementAtOrDefault(0) == "0")
                    {
                        admin.Mesaj = "Persoana nu a for gasita";
                        return;
                    }
                    Nullable<int> id_clasa = bd.IdClasa(materie.Clasa.Clasa).ElementAtOrDefault(0);
                    if (id_clasa==null)
                    {
                        admin.Mesaj = "Clasa nu a for gasita";
                        return;
                    }
                    if (bd.vfPM(cnp, id_materie).ElementAtOrDefault(0) == "0")
                    {
                        bd.AddProfMaterie(id_materie, cnp);
                    }
                    bd.AddProfMaterieClasa(id_materie, cnp, id_clasa);
                    admin.Mesaj = "S-a modificat legatura!";
                    admin.Materii = Materii();
                }
            }


        }

        public void UpdateClasa(object obj)
        {
            ClasaVM clasa = obj as ClasaVM;
            if (clasa != null)
            {
                if (clasa.Clasa == String.Empty)
                {
                    admin.Mesaj = "Introduceti o clasa";
                    return;
                }
                Nullable<int> id_clasa = bd.IdClasa(clasa.Clasa).ElementAtOrDefault(0);
                Nullable<int> id_specializare = bd.IdSpecializare(clasa.Specializare.Specializare).ElementAtOrDefault(0);
                string cnp = bd.CnpProfNP(clasa.Dirig.Nume, clasa.Dirig.Prenume).ElementAtOrDefault(0);
                if (id_clasa == null)
                {
                    admin.Mesaj = "Numele clasei nu se schimba!";
                    return;
                }
                if (id_specializare==null)
                {
                    admin.Mesaj = "Specializarea nu a fost gasita!";
                    return;
                }
                if(cnp==null)
                {
                    admin.Mesaj = "Profesorul nu a fost gasit!";
                    return;
                }
                bd.UpdateClasa(id_specializare, cnp, clasa.Clasa);
                admin.Mesaj = "Clasa modificata cu succes!";
                admin.Clase = Clase();
                admin.NeDiriginti = NeDiriginti();
            }
        }
        public void DeletePersoana(object obj)
        {
            PersoanaVM persoanaVM = obj as PersoanaVM;
            if (persoanaVM == null)
            {
                admin.Mesaj = "Selecteaza o persoana";
                return;
            }

            if(persoanaVM.Rol=="elev")
            {
                if(bd.VfInregistrare(persoanaVM.Username).ElementAtOrDefault(0)=="0")
                {
                    admin.Mesaj = "Persoana nu a fost gasita!";
                    return;
                }
                bd.DeleteUser(persoanaVM.Username);
                admin.Mesaj = "Elevul cu toate informatiile asociate a fost sters!";
                bd.SaveChanges();
                admin.Elevi = Elevi();
                return;
            }
            if (persoanaVM.Rol == "prof")
            {
                if (bd.VfInregistrare(persoanaVM.Username).ElementAtOrDefault(0) == "0")
                {
                    admin.Mesaj = "Persoana nu a fost gasita!";
                    return;
                }
                Nullable<int> id_clasa = bd.Diriginte(persoanaVM.Username).ElementAtOrDefault(0);
                if(id_clasa!=null)
                {
                    string clasa = bd.ClasaDenumire(id_clasa).ElementAtOrDefault(0);
                    admin.Mesaj = "Acest profesor este diriginte! Seteti alt diriginte pt clasa " + clasa;
                    return;
                }
                bd.DeleteAbsenta(persoanaVM.CNP);
                bd.DeleteMedie(persoanaVM.CNP);
                bd.DeleteNota(persoanaVM.CNP);
                bd.DeleteUser(persoanaVM.Username);
                bd.SaveChanges();
                admin.Profi= Profi();
                admin.NeDiriginti = NeDiriginti(); 
                admin.Mesaj = "Profesorul cu toate informatiile asociate a fost sters!";
                return;
            }
        }

        public void DeleteMaterie(object obj)
        {
            MaterieVM materie = obj as MaterieVM;
            if (materie == null)
            {
                admin.Mesaj = "Selecteaza o materei";
                return;
            }
            Nullable<int> id_materie = bd.IdMaterie(materie.Denumire).ElementAtOrDefault(0);
            string cnp = bd.CnpProfNP(materie.Prof.Nume, materie.Prof.Prenume).ElementAtOrDefault(0);
            Nullable<int> id_clasa = bd.IdClasa(materie.Clasa.Clasa).ElementAtOrDefault(0);

            if(id_materie==null)
            {
                admin.Mesaj = "Selecteaza o materei";
                return;
            }
            if(cnp==String.Empty && id_clasa==null)
            {
                bd.DeleteAbsentaMaterie(id_materie,cnp);
                bd.DeleteMedieMaterie(id_materie,cnp);
                bd.DeleteNotaMaterie(id_materie,cnp);
                bd.DeleteMaterie(id_materie);
                admin.Mesaj = "Materia " + materie.Denumire + "cu tot ce ii era asociat a fost stearsa!";
                admin.Materii = Materii();
                return;
            }
            if(id_clasa==null)
            {
                bd.DeleteAbsentaMaterie(id_materie,cnp);
                bd.DeleteMedieMaterie(id_materie,cnp);
                bd.DeleteNotaMaterie(id_materie,cnp);
                bd.DeletePMC(id_materie,cnp);
                bd.DeletePM(id_materie,cnp);
                admin.Mesaj = "Materia " + materie.Denumire + " nu mai e predata de " + materie.Prof.Nume;
                admin.Materii = Materii();
                return;
            }
            bd.DeleteAbsentaMaterie(id_materie,cnp);
            bd.DeleteMedieMaterie(id_materie,cnp);
            bd.DeleteNotaMaterie(id_materie,cnp);
            bd.DeletePMC(id_materie,cnp);
            admin.Mesaj = "Materia " + materie.Denumire+" nu mai e predata de " + materie.Prof.Nume +" la clasa " + materie.Clasa.Clasa;
            admin.Materii = Materii();
            return;

        }

        public void DeleteClasa(object obj)
        {
            ClasaVM clasa = obj as ClasaVM;
            if(clasa!=null)
            {
                if(clasa.Clasa==null)
                {
                    admin.Mesaj = "Selecteaza o clasa!";
                    return;
                }
                Nullable<int> id_clasa = bd.IdClasa(clasa.Clasa).ElementAtOrDefault(0);
                if(id_clasa==null)
                {
                    admin.Mesaj = "Clasa nu a fost gasita!";
                    return;
                }
                bd.UpdateElevClasa(id_clasa);
                bd.DeletePMCClasa(id_clasa);
                bd.DeleteClasa(id_clasa);
                admin.Clase = Clase();
                admin.Materii = Materii();
                admin.NeDiriginti = NeDiriginti();
                admin.Elevi = Elevi();
                admin.Mesaj = "Clasa a fost stearsa! sunt elevi ramasi fara clasa!";
            }
        }
      
    }
}
