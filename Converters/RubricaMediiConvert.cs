using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;
using PlatformaScoala.ViewModels;

namespace PlatformaScoala.Converters
{
    class RubricaMediiConvert : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            if (values[0] != null && values[1] != null && values[2] != null
                && values[3] != null)
            {
                int sem;
                int nota;
                return new RubricaMediiVM()
                {
                    Clasa = values[0] as ClasaVM,
                    Elev = values[1] as PersoanaVM,
                    Materie = values[2] as MaterieVM,
                    Semestru = Int32.TryParse(values[3].ToString(), out sem) ? sem : 1

                };
            }
            else
            {
                return null;
            }
        }

        public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
        {
            RubricaNoteVM rubrica = value as RubricaNoteVM;
            object[] result = new object[4] { rubrica.Clasa, rubrica.Elev, rubrica.Materie, rubrica.Semestru };
            return result;
        }
    }
}
