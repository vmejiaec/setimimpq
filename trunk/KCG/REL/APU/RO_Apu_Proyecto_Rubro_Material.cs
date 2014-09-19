using System.Collections.Generic;
using System.Data;
using System.ComponentModel;
using AEL.APU;
using BEL;
using CEL.APU;

namespace REL.APU
{
    [DataObject]
    public class RO_Apu_Proyecto_Rubro_Material
    {
        #region Adapter

        private static DO_Apu_Proyecto_Rubro_Material _Adapter;

        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public static DO_Apu_Proyecto_Rubro_Material Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Apu_Proyecto_Rubro_Material();
                return _Adapter;
            }
        }
       
        #endregion

        #region Obtención de datos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Apu_Proyecto_Rubro_Material
        /// </summary> 
        /// <returns>Lista de objetos Apu_Proyecto_Rubro_Material</returns> 
      
         public static DataTable GetByProyecto( Scope s , string Apu_Proyecto_Id)
          {

              return EntidadDT.GetDT(Adapter.GetByProyecto(s, Apu_Proyecto_Id).ToArray());
     
          }

        #endregion

        
    }
}
