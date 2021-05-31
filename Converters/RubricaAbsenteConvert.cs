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
    class RubricaAbsenteConvert : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            if (values[0] != null && values[1] != null && values[2] != null && values[3]!= null
                && values[4] != null && values[5].ToString() != String.Empty && values[6] != null)
            {
                int sem;
                return new RubricaAbsenteVM()
                {
                    Clasa = values[0] as ClasaVM,
                    Elev = values[1] as PersoanaVM,
                    Materie = values[2] as MaterieVM,
                    Data = DateTime.Parse(values[3].ToString()),
                    Semestru = Int32.TryParse(values[4].ToString(), out sem) ? sem : 1,
                    Motivabila = (bool) values[5],
                    Motivata = (bool) values[6]
                };

            }
            if (values[0] != null && values[1] != null && values[2] != null && values[3] != null
                && values[4] != null && values[5].ToString() != String.Empty && values[6] == null)
            {
                int sem;
                return new RubricaAbsenteVM()
                {
                    Clasa = values[0] as ClasaVM,
                    Elev = values[1] as PersoanaVM,
                    Materie = values[2] as MaterieVM,
                    Data = DateTime.Parse(values[3].ToString()),
                    Semestru = Int32.TryParse(values[4].ToString(), out sem) ? sem : 1,
                    Motivabila = (bool)values[5],
                    Motivata = false
                };

            }
            else
            {
                return null;
            }
        }

        public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
        {
            RubricaAbsenteVM rubrica = value as RubricaAbsenteVM;
            object[] result = new object[7] { rubrica.Clasa, rubrica.Elev, rubrica.Materie,rubrica.Data, rubrica.Semestru, rubrica.Motivabila, rubrica.Motivata };
            return result;
        }
    }
}
