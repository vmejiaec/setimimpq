using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Reflection;

namespace BEL
{
    /// <summary>
    /// Contiene metodos para facilitar la transformacion
    /// de listas de objetos en data tables
    /// </summary>
    public class EntidadDT
    {
        /// <summary>
        /// Obtiene el data table de una lista de objetos
        /// </summary>
        /// <param name="list">La lista de objetos</param>
        /// <returns></returns>
        public static DataTable GetDT(IList list)
        {
            DataTable dt = new DataTable();
            if (list.Count > 0)
            {
                Type tipo = list[0].GetType();
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
                    
                // Carga los datos
                foreach (object obj in list)
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
