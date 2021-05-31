using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PlatformaScoala.Models;
using PlatformaScoala.ViewModels;
using System.Collections.ObjectModel;

namespace PlatformaScoala.Helpers
{
    class Helper
    {
        public static string UserCurent { get; set; }

        public static ObservableCollection<int> Semestre()
        {
            ObservableCollection<int> list = new ObservableCollection<int>();
            list.Add(1);
            list.Add(2);
            return list;
        }

        public static bool Diriginte()
        {
            ScoalaEntities data = new ScoalaEntities();
            if (data.Diriginte(UserCurent).ElementAtOrDefault(0) != null)
                return true;
            return false;
        }

    }
}
