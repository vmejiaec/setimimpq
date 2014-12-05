using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using ADL.ComprasTableAdapters;
using AEL.COM;
using BEL;
using System.Data.SqlClient;

namespace CEL.COM
{
    public class DO_Com_Contrato_Tipo_Marca
    {
	// adapter
    public Com_Contrato_Tipo_MarcaTableAdapter Adapter = new Com_Contrato_Tipo_MarcaTableAdapter();
	//Select
	public List<Com_Contrato_Tipo_Marca> Get(Scope s)
    {
        List<Com_Contrato_Tipo_Marca> lista = new List<Com_Contrato_Tipo_Marca>();
        var tabla = Adapter.Get();
        foreach (var fila in tabla)
        {
            lista.Add(new Com_Contrato_Tipo_Marca(
				fila.Id,
fila.Nombre,
fila.Com_Contrato_Tipo_Id,
fila.Origen,
fila.Descripcion,
fila.Com_Contrato_Tipo_Nombre
			));
        }
        return lista;
    } // xxx Fin de Select
	//Insert
	public int Insert(Com_Contrato_Tipo_Marca n)
    {
        int res;
        try {
            res = Adapter.Insert(
				n.Nombre,
n.Com_Contrato_Tipo_Id,
n.Origen,
n.Descripcion
			);
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    } // xxx Fin de Insert
	//Delete
	public int Delete(Com_Contrato_Tipo_Marca o)
    {
        int res;
        try { 
            res = Adapter.Delete(
                    o.Id,
o.Nombre,
o.Com_Contrato_Tipo_Id,
o.Origen,
o.Descripcion
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Delete
	//Update
	public int Update(Com_Contrato_Tipo_Marca o, Com_Contrato_Tipo_Marca n)
    {
        int res;
        try
        {
            res = Adapter.Update(
                    n.Nombre,
n.Com_Contrato_Tipo_Id,
n.Origen,
n.Descripcion,
o.Id,
o.Nombre,
o.Com_Contrato_Tipo_Id,
o.Origen,
o.Descripcion,
n.Id
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Update
	// GetByCom_Contrato_Tipo_Id
		public List<Com_Contrato_Tipo_Marca> GetByCom_Contrato_Tipo_Id (Scope s , Int32 p_Com_Contrato_Tipo_Id)
		{
			List<Com_Contrato_Tipo_Marca> lista = new List<Com_Contrato_Tipo_Marca>();
			var tabla = Adapter.GetByCom_Contrato_Tipo_Id( p_Com_Contrato_Tipo_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Com_Contrato_Tipo_Marca(
				fila.Id,
fila.Nombre,
fila.Com_Contrato_Tipo_Id,
fila.Origen,
fila.Descripcion,
fila.Com_Contrato_Tipo_Nombre
				));
			}
			return lista;
		}
		// GetById
		public List<Com_Contrato_Tipo_Marca> GetById (Scope s , Int32 p_Id)
		{
			List<Com_Contrato_Tipo_Marca> lista = new List<Com_Contrato_Tipo_Marca>();
			var tabla = Adapter.GetById( p_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Com_Contrato_Tipo_Marca(
				fila.Id,
fila.Nombre,
fila.Com_Contrato_Tipo_Id,
fila.Origen,
fila.Descripcion,
fila.Com_Contrato_Tipo_Nombre
				));
			}
			return lista;
		}
		// DelByCom_Contrato_Tipo_IdINT
			public int DelByCom_Contrato_Tipo_IdINT (Scope s , Int32 p_Com_Contrato_Tipo_Id)
		{
            int res;
            try
            {
				res = (int)Adapter.DelByCom_Contrato_Tipo_IdINT( p_Com_Contrato_Tipo_Id);
            }
            catch (SqlException e)
            { throw (new Exception(e.Message)); }
            return res;
		}
		// InsertINT
		public int InsertINT(Com_Contrato_Tipo_Marca n)
    {
        int res;
        try {
            res = Convert.ToInt16( Adapter.InsertINT(
				n.Nombre,
n.Com_Contrato_Tipo_Id,
n.Origen,
n.Descripcion
			));
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    }
	}
}
