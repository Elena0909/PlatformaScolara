using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using PlatformaScoala.Commands;
using PlatformaScoala.Views;
using System.ComponentModel;
using PlatformaScoala.Models;
using PlatformaScoala.Helpers;
using System.Linq;

namespace PlatformaScoala.ViewModels
{
    class Logare
    {
        private ScoalaEntities data = new ScoalaEntities();
        public int Log(string user, string parola)
        {
            
            var i = data.Logare(user, parola);
            var u = i.ElementAtOrDefault(0);
            if (u == 1)
            {
                 u = data.Rol(user).ElementAtOrDefault(0);
                Helper.UserCurent = user;
                
            }

            return (int)u;

        }
    }
}
