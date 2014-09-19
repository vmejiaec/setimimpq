using System;
using System.Data;
using System.Reflection;

namespace HER
{
    /// <summary>
    /// Contiene metodos para facilitar la transformacion
    /// de listas de objetos en data tables Version HER
    /// </summary>
    public class EntidadDT
    {
        /// <summary>
        /// Obtiene el data table de una lista de objetos
        /// </summary>
        /// <param name="list">La lista de objetos</param>
        /// <returns></returns>
        public static DataTable GetDT<T>(T[] list)
        {
            Type tipo = typeof (T);
            DataTable dt = new DataTable("Recursos");
            PropertyInfo[] propiedades = tipo.GetProperties();
            // Carga las propiedades
            foreach (PropertyInfo p in propiedades)
            {
                Type tipoColumna = p.PropertyType;
                if (tipoColumna.IsGenericType &&
                tipoColumna.GetGenericTypeDefinition().Equals(typeof(Nullable<>)))
                {
                    tipoColumna = Nullable.GetUnderlyingType(tipoColumna);
                }
                dt.Columns.Add(new DataColumn(p.Name, tipoColumna));
            }
            if (list.Length > 0)
            {
                // Carga los datos
                foreach (T obj in list)
                {
                    object[] row = new object[propiedades.Length];
                    int i = 0;
                    foreach (PropertyInfo p in propiedades)
                        row[i++] = p.GetValue(obj, null);
                    dt.Rows.Add(row);
                }
            }
            // Retorna la tabla
            return dt;
        }
    }
}
