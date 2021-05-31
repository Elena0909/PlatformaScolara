using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PlatformaScoala.Helpers;
using System.Threading.Tasks;

namespace PlatformaScoala.ViewModels
{
    class SpecializareVM : BaseVM
    {
        public SpecializareVM()
        {

        }
        private string specializare;
        public string Specializare
        {
            get
            {
                return specializare;
            }
            set
            {
                specializare = value;
                NotifyPropertyChanged("Specializare");
            }

        }
    }
}
