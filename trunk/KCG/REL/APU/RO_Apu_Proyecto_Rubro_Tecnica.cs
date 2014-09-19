using System.Collections.Generic;
using System.Data;
using System.ComponentModel;
using AEL.APU;
using BEL;
using CEL.APU;

namespace REL.APU
{
    [DataObject]
    public class RO_Apu_Proyecto_Rubro_Tecnica
    {
        #region Adapter

        private DO_Apu_Proyecto_Rubro_Tecnica _Adapter;

        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public DO_Apu_Proyecto_Rubro_Tecnica Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Apu_Proyecto_Rubro_Tecnica();
                return _Adapter;
            }
        }
       
        #endregion

        #region Obtención de datos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Apu_Proyecto_Rubro_Tecnica
        /// </summary> 
        /// <returns>Lista de objetos Apu_Proyecto_Rubro_Tecnica</returns> 

        public DataTable GetByProyecto(Scope s, string Apu_Proyecto_Id)
        {
            return EntidadDT.GetDT(Adapter.GetByProyecto(s, s.Par_Servidor_Id, Apu_Proyecto_Id).ToArray());
        
        }

        #endregion

        
    }
}