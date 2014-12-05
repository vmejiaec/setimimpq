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
    public class DO_Com_Contrato_Tipo
    {
	// adapter
    public Com_Contrato_TipoTableAdapter Adapter = new Com_Contrato_TipoTableAdapter();
	//Select
	public List<Com_Contrato_Tipo> Get(Scope s)
    {
        List<Com_Contrato_Tipo> lista = new List<Com_Contrato_Tipo>();
        var tabla = Adapter.Get();
        foreach (var fila in tabla)
        {
            lista.Add(new Com_Contrato_Tipo(
				fila.Id,
fila.Nombre,
fila.URL_Plantilla_Word
			));
        }
        return lista;
    } // xxx Fin de Select
	//Insert
	public int Insert(Com_Contrato_Tipo n)
    {
        int res;
        try {
            res = Adapter.Insert(
				n.Nombre,
n.URL_Plantilla_Word
			);
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    } // xxx Fin de Insert
	//Delete
	public int Delete(Com_Contrato_Tipo o)
    {
        int res;
        try { 
            res = Adapter.Delete(
                    o.Id,
o.Nombre,
o.URL_Plantilla_Word
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Delete
	//Update
	public int Update(Com_Contrato_Tipo o, Com_Contrato_Tipo n)
    {
        int res;
        try
        {
            res = Adapter.Update(
                    n.Nombre,
n.URL_Plantilla_Word,
o.Id,
o.Nombre,
o.URL_Plantilla_Word,
n.Id
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Update
	// GetById
		public List<Com_Contrato_Tipo> GetById (Scope s , Int32 p_Id)
		{
			List<Com_Contrato_Tipo> lista = new List<Com_Contrato_Tipo>();
			var tabla = Adapter.GetById( p_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Com_Contrato_Tipo(
				fila.Id,
fila.Nombre,
fila.URL_Plantilla_Word
				));
			}
			return lista;
		}
		// GetByLikeNombre
		public List<Com_Contrato_Tipo> GetByLikeNombre (Scope s , string p_Nombre)
		{
			List<Com_Contrato_Tipo> lista = new List<Com_Contrato_Tipo>();
			var tabla = Adapter.GetByLikeNombre( p_Nombre);
			foreach (var fila in tabla)
			{
				lista.Add(new Com_Contrato_Tipo(
				fila.Id,
fila.Nombre,
fila.URL_Plantilla_Word
				));
			}
			return lista;
		}
		// InsertINT
		public int InsertINT(Com_Contrato_Tipo n)
    {
        int res;
        try {
            res = Convert.ToInt16( Adapter.InsertINT(
				n.Nombre,
n.URL_Plantilla_Word
			));
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    }
	}
}
