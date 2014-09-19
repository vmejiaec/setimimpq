using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.ApuTableAdapters;
using AEL.APU;
using BEL;
using System;

namespace CEL.APU
{
    public class DO_Apu_Secuencia
    {
        #region Adapter
        private Apu_SecuenciaTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Apu_SecuenciaTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Apu_SecuenciaTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Apu_Secuencia
        /// </summary> 
        /// <returns>Lista de objetos Apu_Secuencia</returns> 
        public List<APU_Secuencia > Get(Scope s, string Tabla)
        {
            List<APU_Secuencia> lista = new List<APU_Secuencia>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_SecuenciaDataTable tabla = Adapter.Get(Tabla);
                //Carga en la lista
                foreach (Apu.Apu_SecuenciaRow fila in tabla)
                    lista.Add(new APU_Secuencia(fila.Secuencia));
            }
            //Devuleve la Lista
            return lista;
        }
        #endregion
    }
}
