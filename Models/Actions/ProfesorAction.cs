using PlatformaScoala.ViewModels;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System;


namespace PlatformaScoala.Models.Actions
{
    class ProfesorAction
    {
        ScoalaEntities bd = new ScoalaEntities();
        private ProfesorVM prof;

        public ProfesorAction(ProfesorVM prof)
        {
            this.prof = prof;
        }

        public ObservableCollection<RubricaNoteVM> CatalogNote()
        {
            
            List<CatalogProfNote_Result> lista = bd.CatalogProfNote(Helpers.Helper.UserCurent).ToList();
            ObservableCollection<RubricaNoteVM> catalog = new ObservableCollection<RubricaNoteVM>();
            foreach (CatalogProfNote_Result rubrica in lista)
            {

                catalog.Add(new RubricaNoteVM()
                {
                    Clasa = new ClasaVM()
                    {
                        Clasa = rubrica.clasa
                    },
                    Elev = new PersoanaVM()
                    {
                        Nume = rubrica.nume,
                        Prenume = rubrica.prenume
                    },

                    Nota = rubrica.nota,
                    Data = rubrica.data,
                    Teza = rubrica.teza.GetValueOrDefault(),
                    Materie = new MaterieVM() { Denumire = rubrica.denumire },
                    Semestru = (int)rubrica.semestru

                }) ;
            }
            return catalog;
        }

        public ObservableCollection<RubricaAbsenteVM> CatalogAbsente()
        {

            List<CatalogProfAbsente_Result> lista = bd.CatalogProfAbsente(Helpers.Helper.UserCurent).ToList();
            ObservableCollection<RubricaAbsenteVM> catalog = new ObservableCollection<RubricaAbsenteVM>();
            foreach (CatalogProfAbsente_Result rubrica in lista)
            {
                catalog.Add(new RubricaAbsenteVM()
                {
                    Clasa = new ClasaVM()
                    {
                        Clasa = rubrica.clasa
                    },
                    Elev = new PersoanaVM()
                    {
                        Nume = rubrica.nume,
                        Prenume = rubrica.prenume
                    },

                    Motivata = rubrica.motivata.GetValueOrDefault(),
                    Data = rubrica.data,
                    Motivabila = rubrica.motivabila.GetValueOrDefault(),
                    Materie = new MaterieVM() { Denumire = rubrica.denumire },
                    Semestru = rubrica.semestru

                });
            }
            return catalog;
        }

        public ObservableCollection<RubricaMediiVM> CatalogMedii()
        {

            List<CatalogProfMedii_Result> lista = bd.CatalogProfMedii(Helpers.Helper.UserCurent).ToList();
            ObservableCollection<RubricaMediiVM> catalog = new ObservableCollection<RubricaMediiVM>();
            foreach (CatalogProfMedii_Result rubrica in lista)
            {
                catalog.Add(new RubricaMediiVM()
                {
                    Clasa = new ClasaVM()
                    {
                        Clasa = rubrica.clasa
                    },
                    Elev = new PersoanaVM()
                    {
                        Nume = rubrica.nume,
                        Prenume = rubrica.prenume
                    },
                    Nota = rubrica.nota.GetValueOrDefault(),
                        Materie = new MaterieVM { Denumire = rubrica.denumire },
                        Semestru = rubrica.semestru.GetValueOrDefault()
                    
                });
            }
            return catalog;
        }

        public ObservableCollection<MaterieVM> Materii()
        {

            List<MateriiProf_Result> lista = bd.MateriiProf(Helpers.Helper.UserCurent).ToList();
            ObservableCollection<MaterieVM> materii = new ObservableCollection<MaterieVM>();
            foreach (MateriiProf_Result materie in lista)
            {
                materii.Add(new MaterieVM()
                {
                    Denumire = materie.denumire,
                    
                }) ;
            }
            return materii;
        }

        public ObservableCollection<ClasaVM> Clase()
        {
            Nullable<int> id_materie;
            ObservableCollection<ClasaVM> clase = new ObservableCollection<ClasaVM>();
            if (prof.Materie != null)
            {
                id_materie = bd.IdMaterie(prof.Materie.Denumire).ElementAtOrDefault(0);
                if (id_materie == null)
                {
                    prof.Mesaj = "Materia nu a fost gasita!";
                }
                else
                {
                    List<ClaseProfMaterie_Result> lista = bd.ClaseProfMaterie(Helpers.Helper.UserCurent, id_materie).ToList();

                    foreach (ClaseProfMaterie_Result clasa in lista)
                    {
                        clase.Add(new ClasaVM()
                        {
                            Clasa = clasa.clasa

                        });
                    }
                }
            }
            return clase;
        }

        public ObservableCollection<PersoanaVM> Elevi()
        {
            Nullable<int> id_clasa;

            ObservableCollection<PersoanaVM> elevi = new ObservableCollection<PersoanaVM>();
            if (prof.Clasa != null)
            {
                id_clasa = bd.IdClasa(prof.Clasa.Clasa).ElementAtOrDefault(0);
                if (id_clasa == null)
                {
                    prof.Mesaj = "Clasa nu a fost gasita!";
                }
                else
                {
                    List<ElevClasa_Result> lista = bd.ElevClasa(id_clasa).ToList();

                    foreach (ElevClasa_Result elev in lista)
                    {
                        elevi.Add(new PersoanaVM()
                        {
                           Nume=elev.Nume,
                           Prenume=elev.Prenume,
                           Username= elev.Username

                        });
                    }
                }
            }
            return elevi;
        }

        public ObservableCollection<bool> Teza()
        {
            ObservableCollection<bool> teza = new ObservableCollection<bool>();
            teza.Add(false);
            if (prof.Materie!=null && prof.Clasa!=null)
            {
                Nullable<int> id_materie, id_specializare,id_clasa;
                id_materie = bd.IdMaterie(prof.Materie.Denumire).ElementAtOrDefault(0);
                if (id_materie == null)
                {
                    prof.Mesaj = "Materia nu a fost gasita!";
                }
                id_clasa = bd.IdClasa(prof.Clasa.Clasa).ElementAtOrDefault(0);
                if (id_clasa == null)
                {
                    prof.Mesaj = "Clasa nu a fost gasita!";
                }
                id_specializare = bd.IdSpecializareClasa(id_clasa).ElementAtOrDefault(0);
                if (id_specializare == null)
                {
                    prof.Mesaj = "Specializare nu a fost gasita!";
                }
                if(bd.Teza(id_materie,id_specializare).ElementAtOrDefault(0)==1)
                {
                    teza.Add(true);
                }

            }
            return teza;
        }

        public void AddNota(object obj)
        {
            RubricaNoteVM rubrica = obj as RubricaNoteVM;
            if (rubrica != null)
            {
                if (rubrica.Elev == null)
                {
                    prof.Mesaj = "Selectati un elev";
                    return;
                }

                string cnp_elev = bd.CnpElevNP(rubrica.Elev.Nume, rubrica.Elev.Prenume).ElementAtOrDefault(0);
                if(cnp_elev==String.Empty)
                {
                    prof.Mesaj = "Elevul nu a fost gasi!t";
                    return;
                }
                string cnp_prof = bd.CnpProf(Helpers.Helper.UserCurent).ElementAtOrDefault(0);
                if (cnp_prof == String.Empty)
                {
                    prof.Mesaj = "Prof nu a fost gasit!";
                    return;
                }
                Nullable<int> id_materie = bd.IdMaterie(rubrica.Materie.Denumire).ElementAtOrDefault(0);
                
                if (id_materie==null)
                {
                    prof.Mesaj = "Materia nu a fost gasita!";
                    return;
                }
                Nullable<int> id_clasa = bd.IdClasa(rubrica.Clasa.Clasa).ElementAtOrDefault(0);
                if(id_clasa==null)
                {
                    prof.Mesaj = "Clasa nu a fost gasita!";
                    return;
                }
                if(rubrica.Nota<1 || rubrica.Nota>10)
                {
                    prof.Mesaj = "Nota trebuie sa fie cuprinsa intre 1 si 10!";
                    return;
                }
                if(rubrica.Teza==true)
                {
                    Nullable<int> nota = bd.NotaTeza(id_materie, cnp_elev, cnp_prof, rubrica.Semestru).ElementAtOrDefault(0);
                    if(nota != null)
                    {
                        prof.Mesaj = "Elevul are deja teza la materia asta!";
                        return;
                    }
                }
                Nullable<int> medie = bd.VfMedie(cnp_elev, cnp_prof, rubrica.Semestru, id_materie).ElementAtOrDefault(0);
                if(medie!=null)
                {
                    prof.Mesaj = "Elevul are media incheiata deja!";
                    return;
                }
                bd.AddNota(cnp_elev, cnp_prof, id_materie, rubrica.Nota, rubrica.Data, rubrica.Semestru, rubrica.Teza);
               
                prof.Mesaj = "Nota adaugata!";
                prof.CatalogNote = CatalogNote();
                return;
            }
            prof.Mesaj = "Date incomplete!";
        }

        public void DeleteNota(object obj)
        {
            RubricaNoteVM rubrica = obj as RubricaNoteVM;
            if (rubrica != null)
            {
                if (rubrica.Elev == null)
                {
                    prof.Mesaj = "Selectati un elev";
                    return;
                }

                string cnp_elev = bd.CnpElevNP(rubrica.Elev.Nume, rubrica.Elev.Prenume).ElementAtOrDefault(0);
                if (cnp_elev == String.Empty)
                {
                    prof.Mesaj = "Elevul nu a fost gasi!t";
                    return;
                }
                string cnp_prof = bd.CnpProf(Helpers.Helper.UserCurent).ElementAtOrDefault(0);
                if (cnp_prof == String.Empty)
                {
                    prof.Mesaj = "Prof nu a fost gasit!";
                    return;
                }
                Nullable<int> id_materie = bd.IdMaterie(rubrica.Materie.Denumire).ElementAtOrDefault(0);

                if (id_materie == null)
                {
                    prof.Mesaj = "Materia nu a fost gasita!";
                    return;
                }
                Nullable<int> id_clasa = bd.IdClasa(rubrica.Clasa.Clasa).ElementAtOrDefault(0);
                if (id_clasa == null)
                {
                    prof.Mesaj = "Clasa nu a fost gasita!";
                    return;
                }
                if(bd.vfNota(cnp_elev, cnp_prof, id_materie, rubrica.Data, rubrica.Semestru, rubrica.Nota, rubrica.Teza).ElementAtOrDefault(0)==0)
                {
                    prof.Mesaj = "Nota nu a fost gasita!";
                    prof.CatalogNote = CatalogNote();
                    return;
                }
                bd.AnulareNota(cnp_elev, cnp_prof, id_materie, rubrica.Nota, rubrica.Data, rubrica.Semestru, rubrica.Teza);
                prof.Mesaj = "Nota a fost anulata!";
                prof.CatalogNote = CatalogNote();

            }
        }

        public void AddAbsenta(object obj)
        {
            RubricaAbsenteVM rubrica = obj as RubricaAbsenteVM;
            if (rubrica != null)
            {
                if (rubrica.Elev == null)
                {
                    prof.Mesaj = "Selectati un elev";
                    return;
                }

                string cnp_elev = bd.CnpElevNP(rubrica.Elev.Nume, rubrica.Elev.Prenume).ElementAtOrDefault(0);
                if (cnp_elev == String.Empty)
                {
                    prof.Mesaj = "Elevul nu a fost gasi!t";
                    return;
                }
                string cnp_prof = bd.CnpProf(Helpers.Helper.UserCurent).ElementAtOrDefault(0);
                if (cnp_prof == String.Empty)
                {
                    prof.Mesaj = "Prof nu a fost gasit!";
                    return;
                }
                Nullable<int> id_materie = bd.IdMaterie(rubrica.Materie.Denumire).ElementAtOrDefault(0);

                if (id_materie == null)
                {
                    prof.Mesaj = "Materia nu a fost gasita!";
                    return;
                }
                Nullable<int> id_clasa = bd.IdClasa(rubrica.Clasa.Clasa).ElementAtOrDefault(0);
                if (id_clasa == null)
                {
                    prof.Mesaj = "Clasa nu a fost gasita!";
                    return;
                }

                bd.AddAbsenta(cnp_elev, cnp_prof, id_materie, rubrica.Data, rubrica.Semestru, rubrica.Motivabila);

                prof.Mesaj = "Absenta adaugata!";
                prof.CatalogAbsente = CatalogAbsente();
                return;
            }
            prof.Mesaj = "Date incomplete!";
        }

        public void Motivare(object obj)
        {
            RubricaAbsenteVM rubrica = obj as RubricaAbsenteVM;
            if (rubrica != null)
            {
                if (rubrica.Elev == null)
                {
                    prof.Mesaj = "Selectati un elev";
                    return;
                }

                string cnp_elev = bd.CnpElevNP(rubrica.Elev.Nume, rubrica.Elev.Prenume).ElementAtOrDefault(0);
                if (cnp_elev == String.Empty)
                {
                    prof.Mesaj = "Elevul nu a fost gasi!t";
                    return;
                }
                string cnp_prof = bd.CnpProf(Helpers.Helper.UserCurent).ElementAtOrDefault(0);
                if (cnp_prof == String.Empty)
                {
                    prof.Mesaj = "Prof nu a fost gasit!";
                    return;
                }
                Nullable<int> id_materie = bd.IdMaterie(rubrica.Materie.Denumire).ElementAtOrDefault(0);

                if (id_materie == null)
                {
                    prof.Mesaj = "Materia nu a fost gasita!";
                    return;
                }
                Nullable<int> id_clasa = bd.IdClasa(rubrica.Clasa.Clasa).ElementAtOrDefault(0);
                if (id_clasa == null)
                {
                    prof.Mesaj = "Clasa nu a fost gasita!";
                    return;
                }
                if (rubrica.Motivabila == true)
                {
                    if(bd.vfAbsenta(cnp_elev, cnp_prof, id_materie, rubrica.Data, rubrica.Semestru, rubrica.Motivabila).ElementAtOrDefault(0)==0)
                    {
                        prof.Mesaj = "Absenta nu a fost gasita!";
                        prof.CatalogAbsente = CatalogAbsente();
                        return;
                    }
                    bd.MotiveazaAbsenta(cnp_elev, cnp_prof, id_materie, rubrica.Data, rubrica.Semestru, rubrica.Motivabila);

                    prof.Mesaj = "Absenta motivata!";
                    prof.CatalogAbsente = CatalogAbsente();
                    return;
                }
                prof.Mesaj = "Absenta nu e motivabila!";
                prof.CatalogAbsente = CatalogAbsente();
                return;
            }
            prof.Mesaj = "Date incomplete!";
        }

        public void CalculMedie(object obj)
        {
            RubricaMediiVM rubrica = obj as RubricaMediiVM;
            if(rubrica!=null)
            {
                Nullable<int> id_clasa = bd.IdClasa(rubrica.Clasa.Clasa).ElementAtOrDefault(0);
                Nullable<int> id_materie = bd.IdMaterie(rubrica.Materie.Denumire).ElementAtOrDefault(0);
                Nullable<int> id_specializare = bd.IdSpecializareClasa(id_clasa).ElementAtOrDefault(0);
                if(id_clasa==null || id_materie==null || id_specializare==null)
                {
                    prof.Mesaj = "Ceva nu a mers bine!";
                    return;
                }
                string cnp_elev = bd.CnpElevNP(rubrica.Elev.Nume, rubrica.Elev.Prenume).ElementAtOrDefault(0);
                string cnp_prof = bd.CnpProf(Helpers.Helper.UserCurent).ElementAtOrDefault(0);
                if(bd.NrNote(cnp_elev,id_materie,cnp_prof,rubrica.Semestru).ElementAtOrDefault(0)<3)
                {
                    prof.Mesaj = "elevul inca nu are 3 note la aceasta materie!";
                    return;
                }
                Nullable<int> medie;
                medie = bd.VfMedie(cnp_elev, cnp_prof, rubrica.Semestru, id_materie).ElementAtOrDefault(0);
                if (medie != null)
                {
                    prof.Mesaj = "Elevul are media incheiata deja!";
                    return;
                }
                if (bd.Teza(id_materie,id_specializare).ElementAtOrDefault(0)==1)
                {
                    Nullable<int> teza = bd.NotaTeza(id_materie, cnp_elev, cnp_prof, rubrica.Semestru).ElementAtOrDefault(0);
                    if(teza==null)
                    {
                        prof.Mesaj = "Elevul nu are nota la teza!";
                        return;
                    }
                     medie = bd.CalculMedie(id_materie, cnp_elev, cnp_prof, rubrica.Semestru).ElementAtOrDefault(0);
                    if(medie==null)
                    {
                        prof.Mesaj = "Ceva nu a mers bine!";
                        return;
                    }
                    int medieFinala = (medie.GetValueOrDefault() * 3 + teza.GetValueOrDefault()) / 4;
                    bd.AddMedie(cnp_elev, cnp_prof, id_materie, rubrica.Semestru, medieFinala);
                    prof.Mesaj = "Media a fost calculata";
                    prof.CatalogMedii = CatalogMedii();
                    return;
                }
                medie = bd.CalculMedie(id_materie, cnp_elev, cnp_prof, rubrica.Semestru).ElementAtOrDefault(0);
                if (medie == 0)
                {
                    prof.Mesaj = "Ceva nu a mers bine!";
                    return;
                }
                bd.AddMedie(cnp_elev, cnp_prof, id_materie, rubrica.Semestru, medie);
                prof.Mesaj = "Media a fost calculata";
                prof.CatalogMedii = CatalogMedii();
                return;
            }
        }

    }
}
