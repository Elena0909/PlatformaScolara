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
    class MaterieConvert : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            if (values[0] != null && values[1]!=null && values[2]!=null)
            {
                return new MaterieVM()
                {
                    Denumire = values[0].ToString(),
                    Prof = values[1] as PersoanaVM,
                    Clasa = values[2] as ClasaVM
                };

            }
            if (values[0] != null && values[1] != null)
            {
                return new MaterieVM()
                {
                    Denumire = values[0].ToString(),
                    Prof = values[1] as PersoanaVM
                };
            }
            if (values[0] != null)
            {
                return new MaterieVM()
                {
                    Denumire = values[0].ToString()   
                };
            }
            else
            {
                return null;
            }
        }

        public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
        {
            MaterieVM materie = value as MaterieVM;
            object[] result = new object[3] { materie.Denumire, materie.Prof, materie.Clasa };
            return result;
        }
    }
}
