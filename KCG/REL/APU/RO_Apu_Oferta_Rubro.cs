
using System.Data;
using System.ComponentModel;
using BEL;
using CEL.APU;
    
    namespace REL.APU
    {
    [DataObject]
    public class RO_Apu_Oferta_Rubro
    {
    #region Adapter
    private DO_Apu_Oferta_Rubro _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public DO_Apu_Oferta_Rubro Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new DO_Apu_Oferta_Rubro();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]

        public DataTable GetByOferta(Scope s, string Apu_Oferta_Id)
        {
            return EntidadDT.GetDT(Adapter.GetByOferta(s, Apu_Oferta_Id).ToArray());
            
        }
    #endregion
    }
    }
