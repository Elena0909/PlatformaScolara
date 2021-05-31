using PlatformaScoala.ViewModels;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System;


namespace PlatformaScoala.Models.Actions
{
    class ElevAction
    {
        ScoalaEntities bd = new ScoalaEntities();
        private ElevVM elev;

        public ElevAction(ElevVM elev)
        {
            this.elev = elev;
        }

        public ObservableCollection<NotaVM> Note()
        {
            string cnp = bd.CnpElev(Helpers.Helper.UserCurent).FirstOrDefault();
            List<NoteElev_Result> lista = bd.NoteElev(cnp).ToList();
            ObservableCollection<NotaVM> note = new ObservableCollection<NotaVM>();
            foreach (NoteElev_Result nota in lista)
            {
                note.Add(new NotaVM()
                {
                    Materie = new MaterieVM() { Denumire = nota.materie },
                    Nota = nota.nota,
                    Data = nota.data,
                    Semestru = nota.semestru,
                    Teza = nota.teza.GetValueOrDefault()

                });
            }
            return note;
        }

        public ObservableCollection<AbsentaVM> Absente()
        {
            string cnp = bd.CnpElev(Helpers.Helper.UserCurent).FirstOrDefault();
            List<AbsenteElev_Result> lista = bd.AbsenteElev(cnp).ToList();
            ObservableCollection<AbsentaVM> absente = new ObservableCollection<AbsentaVM>();
            foreach (AbsenteElev_Result absenta in lista)
            {
                absente.Add(new AbsentaVM()
                {
                    Materie = absenta.materie,
                    Data = absenta.data,
                    Semestru = absenta.semestru,
                    Motivabila = absenta.motivabila.GetValueOrDefault(),
                    Motivata = absenta.motivata.GetValueOrDefault()
                });
            }
            return absente;
        }

        public ObservableCollection<MedieVM> Medii()
        {
            string cnp = bd.CnpElev(Helpers.Helper.UserCurent).FirstOrDefault();
            List<MediiElev_Result> lista = bd.MediiElev(cnp).ToList();
            ObservableCollection<MedieVM> medii = new ObservableCollection<MedieVM>();
            foreach (MediiElev_Result medie in lista)
            {
                medii.Add(new MedieVM()
                {
                    Materie = medie.materie,
                    Nota = medie.nota.GetValueOrDefault(),
                    Semestru = medie.semestru.GetValueOrDefault()

                });
            }
            return medii;
        }
    }
}
