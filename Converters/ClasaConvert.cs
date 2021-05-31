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
    class ClasaConvert : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            if (values[0] != null && values[1] != null && values[2] != null)
            {
                return new ClasaVM()
                {
                    Clasa=values[0].ToString(),
                    Specializare=values[1] as SpecializareVM,
                    Dirig=values[2] as PersoanaVM
                };

            }
            else
            {
                return null;
            }
        }

        public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
        {
            ClasaVM clasa = value as ClasaVM;
            object[] result = new object[3] { clasa.Clasa, clasa.Specializare, clasa.Dirig };
            return result;
        }
    }
}