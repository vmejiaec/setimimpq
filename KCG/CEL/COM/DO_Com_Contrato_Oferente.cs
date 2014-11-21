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
    public class DO_Com_Contrato_Oferente
    {
	// adapter
    public Com_Contrato_OferenteTableAdapter Adapter = new Com_Contrato_OferenteTableAdapter();
	//Select
	public List<Com_Contrato_Oferente> Get(Scope s)
    {
        List<Com_Contrato_Oferente> lista = new List<Com_Contrato_Oferente>();
        var tabla = Adapter.Get();
        foreach (var fila in tabla)
        {
            lista.Add(new Com_Contrato_Oferente(
				fila.Id,
fila.Nombre,
fila.Fecha_Recepcion,
fila.Com_Contrato_Id,
fila.Per_Personal_Id_Recibe,
fila.Comentario
			));
        }
        return lista;
    } // xxx Fin de Select
	//Insert
	public int Insert(Com_Contrato_Oferente n)
    {
        int res;
        try {
            res = Adapter.Insert(
				n.Nombre,
n.Fecha_Recepcion,
n.Com_Contrato_Id,
n.Per_Personal_Id_Recibe,
n.Comentario
			);
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    } // xxx Fin de Insert
	//Delete
	public int Delete(Com_Contrato_Oferente o)
    {
        int res;
        try { 
            res = Adapter.Delete(
                    o.Id,
o.Nombre,
o.Fecha_Recepcion,
o.Com_Contrato_Id,
o.Per_Personal_Id_Recibe,
o.Comentario
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Delete
	//Update
	public int Update(Com_Contrato_Oferente o, Com_Contrato_Oferente n)
    {
        int res;
        try
        {
            res = Adapter.Update(
                    n.Nombre,
n.Fecha_Recepcion,
n.Com_Contrato_Id,
n.Per_Personal_Id_Recibe,
n.Comentario,
o.Id,
o.Nombre,
o.Fecha_Recepcion,
o.Com_Contrato_Id,
o.Per_Personal_Id_Recibe,
o.Comentario,
n.Id
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Update
	// GetByCom_Contrato_Id
		public List<Com_Contrato_Oferente> GetByCom_Contrato_Id (Scope s , Int32 p_Com_Contrato_Id)
		{
			List<Com_Contrato_Oferente> lista = new List<Com_Contrato_Oferente>();
			var tabla = Adapter.GetByCom_Contrato_Id( p_Com_Contrato_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Com_Contrato_Oferente(
				fila.Id,
fila.Nombre,
fila.Fecha_Recepcion,
fila.Com_Contrato_Id,
fila.Per_Personal_Id_Recibe,
fila.Comentario
				));
			}
			return lista;
		}
		// GetById
		public List<Com_Contrato_Oferente> GetById (Scope s , Int32 p_Id)
		{
			List<Com_Contrato_Oferente> lista = new List<Com_Contrato_Oferente>();
			var tabla = Adapter.GetById( p_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Com_Contrato_Oferente(
				fila.Id,
fila.Nombre,
fila.Fecha_Recepcion,
fila.Com_Contrato_Id,
fila.Per_Personal_Id_Recibe,
fila.Comentario
				));
			}
			return lista;
		}
		// InsertINT
		public int InsertINT(Com_Contrato_Oferente n)
    {
        int res;
        try {
            res = Convert.ToInt16( Adapter.InsertINT(
				n.Nombre,
n.Fecha_Recepcion,
n.Com_Contrato_Id,
n.Per_Personal_Id_Recibe,
n.Comentario
			));
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    }
	}
}
