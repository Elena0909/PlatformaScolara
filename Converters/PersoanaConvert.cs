using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;
using PlatformaScoala.ViewModels;

namespace PlatformaScoala.Coverters
{
    class PersoanaConvert : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            if (values[0] != null && values[1] != null && values[2]!=null && values[3]!=null && values[4] != null && values[5] != null
                && values[6] != null)
            {
                return new PersoanaVM()
                {
                    Nume = values[0].ToString(),
                    Prenume = values[1].ToString(), 
                    CNP = values[2].ToString(),
                    Username = values[3].ToString(),
                    Parola = values[4].ToString(),
                    Clasa = values[5] as ClasaVM,
                    Rol = values[6].ToString(),
                };

            }
            else
            {
                return null;
            }
        }

        public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
        {
            PersoanaVM pers = value as PersoanaVM;
            object[] result = new object[6] { pers.Nume, pers.Prenume, pers.CNP, pers.Username,pers.Parola,pers.Clasa};
            return result;
        }
    }
}
