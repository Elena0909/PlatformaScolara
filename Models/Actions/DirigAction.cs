using PlatformaScoala.ViewModels;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System;



namespace PlatformaScoala.Models.Actions
{
    class DirigAction
    {
        ScoalaEntities bd = new ScoalaEntities();
        private DirigVM dirig;

        public DirigAction(DirigVM dirig)
        {
            this.dirig = dirig;
        }

       public ObservableCollection<RubricaAbsenteVM> CatalogAbsente()
        {
            ObservableCollection<RubricaAbsenteVM> catalog = new ObservableCollection<RubricaAbsenteVM>();
            if (dirig.Nemotivabile == false)
            {
                List<AbsenteDirig_Result> listaT = bd.AbsenteDirig(Helpers.Helper.UserCurent).ToList();
                
                foreach (AbsenteDirig_Result rubrica in listaT)
                {
                    catalog.Add(new RubricaAbsenteVM()
                    {

                        Elev = new PersoanaVM()
                        {
                            Nume = rubrica.Nume,
                            Prenume = rubrica.Prenume
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
            List<AbsenteNDirig_Result> lista = bd.AbsenteNDirig(Helpers.Helper.UserCurent).ToList();
           
            foreach (AbsenteNDirig_Result rubrica in lista)
            {
                catalog.Add(new RubricaAbsenteVM()
                {

                    Elev = new PersoanaVM()
                    {
                        Nume = rubrica.Nume,
                        Prenume = rubrica.Prenume
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

        public void Motivare(object obj)
        {
            RubricaAbsenteVM rubrica = obj as RubricaAbsenteVM;
            if (rubrica != null)
            {
                if (rubrica.Elev == null)
                {
                    dirig.Mesaj = "Selectati un elev";
                    return;
                }

                string cnp_elev = bd.CnpElevNP(rubrica.Elev.Nume, rubrica.Elev.Prenume).ElementAtOrDefault(0);
                if (cnp_elev == String.Empty)
                {
                    dirig.Mesaj = "Elevul nu a fost gasi!t";
                    return;
                }
                
                Nullable<int> id_materie = bd.IdMaterie(rubrica.Materie.Denumire).ElementAtOrDefault(0);

                if (id_materie == null)
                {
                    dirig.Mesaj = "Materia nu a fost gasita!";
                    return;
                }
                string cnp_prof = bd.ProfCNP(id_materie, cnp_elev).ElementAtOrDefault(0);
                if (cnp_prof == String.Empty)
                {
                    dirig.Mesaj = "Prof nu a fost gasit!";
                    return;
                }

                if (rubrica.Motivabila == true)
                {
                    if (bd.vfAbsenta(cnp_elev, cnp_prof, id_materie, rubrica.Data, rubrica.Semestru, rubrica.Motivabila).ElementAtOrDefault(0) == 0)
                    {
                        dirig.Mesaj = "Absenta nu a fost gasita!";
                        dirig.CatalogAbsente = CatalogAbsente();
                        return;
                    }
                    bd.MotiveazaAbsenta(cnp_elev, cnp_prof, id_materie, rubrica.Data, rubrica.Semestru, rubrica.Motivabila);

                    dirig.Mesaj = "Absenta motivata!";
                    dirig.CatalogAbsente = CatalogAbsente();
                    return;
                }
                dirig.Mesaj = "Absenta nu e motivabila!";
                dirig.CatalogAbsente = CatalogAbsente();
                return;
            }
            dirig.Mesaj = "Date incomplete!";
        }

        public int NrAbsente()
        {
            if (dirig.Nemotivabile == false)
                return bd.TotalAbsente(Helpers.Helper.UserCurent).ElementAtOrDefault(0).GetValueOrDefault();
            return bd.AbsenteNemotivate(Helpers.Helper.UserCurent).ElementAtOrDefault(0).GetValueOrDefault();

        }

        public int NrAbsenteElev()
        {
            if (dirig.ElevCurent != null)
            {
                string cnp_elev = bd.CnpElevNP(dirig.ElevCurent.Nume, dirig.ElevCurent.Prenume).ElementAtOrDefault(0);
                if (dirig.NemotivabileElev == false)
                    return bd.TotalAbsenteElev(Helpers.Helper.UserCurent, cnp_elev).ElementAtOrDefault(0).GetValueOrDefault();
                return bd.AbsenteNemotivateElev(Helpers.Helper.UserCurent, cnp_elev).ElementAtOrDefault(0).GetValueOrDefault();
            }
            return 0;

        }

        public ObservableCollection<PersoanaVM> Elevi()
        {
            List<EleviClasa_Result> lista = bd.EleviClasa(Helpers.Helper.UserCurent).ToList();
            ObservableCollection<PersoanaVM> elevi = new ObservableCollection<PersoanaVM>();
            foreach(EleviClasa_Result elev in lista)
            {
                elevi.Add(new PersoanaVM()
                {
                    Nume = elev.nume,
                    Prenume = elev.prenume
                });
            }
            return elevi;
        }

        public ObservableCollection<RubricaAbsenteVM> AbsenteElev()
        {
            ObservableCollection<RubricaAbsenteVM> catalog = new ObservableCollection<RubricaAbsenteVM>();
            if (dirig.ElevCurent != null)
            {
                string cnp_elev = bd.CnpElevNP(dirig.ElevCurent.Nume, dirig.ElevCurent.Prenume).ElementAtOrDefault(0);


                if (dirig.NemotivabileElev == false)
                {
                    List<VizAbsElev_Result> listaT = bd.VizAbsElev(Helpers.Helper.UserCurent, cnp_elev).ToList();

                    foreach (VizAbsElev_Result rubrica in listaT)
                    {
                        catalog.Add(new RubricaAbsenteVM()
                        {

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
                List<VizAbsNElev_Result> listaN = bd.VizAbsNElev(Helpers.Helper.UserCurent, cnp_elev).ToList();

                foreach (VizAbsNElev_Result rubrica in listaN)
                {
                    catalog.Add(new RubricaAbsenteVM()
                    {

                        Elev = new PersoanaVM()
                        {
                            Nume = rubrica.Nume,
                            Prenume = rubrica.Prenume
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
            return catalog;
        }

        public ObservableCollection<MedieVM> MediiElev()
        {
            ObservableCollection<MedieVM> medii = new ObservableCollection<MedieVM>();
            if (dirig.ElevCurent != null)
            {
                string cnp = bd.CnpElevNP(dirig.ElevCurent.Nume, dirig.ElevCurent.Prenume).ElementAtOrDefault(0);
                List<MediiElev_Result> lista = bd.MediiElev(cnp).ToList();
               
                foreach(MediiElev_Result medie in lista)
                {
                    medii.Add(new MedieVM()
                    {
                        Nota = medie.nota.GetValueOrDefault(),
                        Materie = medie.materie.ToString(),
                        Semestru = medie.semestru.GetValueOrDefault()
                    });
                }
              
            }
            return medii;
        }

        public double MedieF()
        {
            if (dirig.ElevCurent != null)
            {
                string cnp = bd.CnpElevNP(dirig.ElevCurent.Nume, dirig.ElevCurent.Prenume).ElementAtOrDefault(0);
                double medie = (bd.MediaFinala(cnp, 1).ElementAtOrDefault(0).GetValueOrDefault() + bd.MediaFinala(cnp, 2).ElementAtOrDefault(0).GetValueOrDefault()) / 2;
                return medie;
            }
            return 0;
        }
       

        public ObservableCollection<RubricaMediiVM> Corigenti()
        {
            string cnp = bd.CnpProf(Helpers.Helper.UserCurent).ElementAtOrDefault(0);
            List<CorigentiClasa_Result> lista = bd.CorigentiClasa(cnp).ToList();
            ObservableCollection<RubricaMediiVM> corigenti = new ObservableCollection<RubricaMediiVM>();
            foreach (CorigentiClasa_Result corigent in lista)
            {
                corigenti.Add(new RubricaMediiVM()
                {
                    Elev = new PersoanaVM()
                    {
                        Nume = corigent.Nume,
                        Prenume = corigent.Prenume
                    },
                    Materie = new MaterieVM() { Denumire = corigent.denumire },
                    Nota = corigent.nota.GetValueOrDefault(),
                    Semestru =corigent.semestru.GetValueOrDefault()
                    
                });

                
            }
            return corigenti;
        }
    }
}
