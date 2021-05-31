using PlatformaScoala.Helpers;
using System.Collections.ObjectModel;
using PlatformaScoala.Models.Actions;
using PlatformaScoala.Commands;
using System.Windows.Input;

namespace PlatformaScoala.ViewModels
{
    class ElevVM : BaseVM
    {
        ElevAction elevAction;
        public ElevVM()
        {
            elevAction = new ElevAction(this);
        }

        private ObservableCollection<AbsentaVM> absente;
        public ObservableCollection<AbsentaVM> Absente
        {
            get
            {
                absente = elevAction.Absente();
                return absente;
            }
            set
            {
                absente = value;
                NotifyPropertyChanged("Absente");
            }
        }

        private ObservableCollection<NotaVM> note;
        public ObservableCollection<NotaVM> Note
        {
            get
            {
                note = elevAction.Note();
                return note;
            }
            set
            {
                note = value;
                NotifyPropertyChanged("Note");
            }
        }
        private ObservableCollection<MedieVM> medii;
        public ObservableCollection<MedieVM> Medii
        {
            get
            {
                medii = elevAction.Medii();
                return medii;
            }
            set
            {
                medii = value;
                NotifyPropertyChanged("Medii");
            }
        }
    }
}
