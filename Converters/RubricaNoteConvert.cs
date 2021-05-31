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
    class RubricaNoteConvert : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            if (values[0] != null && values[1] != null && values[2] != null && values[3].ToString() != String.Empty
                && values[4] != null && values[5] != null && values[6] != null)
            {
                int sem;
                int nota;
                return new RubricaNoteVM()
                {
                    Clasa = values[0] as ClasaVM,
                    Elev = values[1] as PersoanaVM,
                    Materie = values[2] as MaterieVM,
                    Nota = Int32.TryParse(values[3].ToString(), out nota) ? nota : 1,
                    Data = DateTime.Parse(values[4].ToString()),
                    Semestru = Int32.TryParse(values[5].ToString(), out sem) ? sem : 1,
                    Teza = (bool) values[6]
                };

            }
            if (values[0] != null && values[1] != null && values[2] != null && values[3].ToString() != String.Empty
               && values[4] != null && values[5]!= null && values[6]==null)
            {
                int sem;
                int nota;
                return new RubricaNoteVM()
                {
                    Clasa = values[0] as ClasaVM,
                    Elev = values[1] as PersoanaVM,
                    Materie = values[2] as MaterieVM,
                    Nota = Int32.TryParse(values[3].ToString(), out nota) ? nota : 1,
                    Data = DateTime.Parse(values[4].ToString()),
                    Semestru = Int32.TryParse(values[5].ToString(), out sem) ? sem : 1,
                    Teza = false
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
            object[] result = new object[7] { rubrica.Clasa, rubrica.Elev, rubrica.Materie, rubrica.Nota, rubrica.Data,rubrica.Semestru,rubrica.Teza };
            return result;
        }
    }
}
