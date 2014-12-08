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
    public class DO_Com_Planilla_Deposito
    {
	// adapter
    public Com_Planilla_DepositoTableAdapter Adapter = new Com_Planilla_DepositoTableAdapter();
	//Select
	public List<Com_Planilla_Deposito> Get(Scope s)
    {
        List<Com_Planilla_Deposito> lista = new List<Com_Planilla_Deposito>();
        var tabla = Adapter.Get();
        foreach (var fila in tabla)
        {
            lista.Add(new Com_Planilla_Deposito(
				fila.Id,
fila.Fis_Planilla_Id,
fila.Codigo_Deposito,
fila.Fecha_Deposito,
fila.Comprobante_Ctbl,
fila.Valor,
fila.Valor_Interes,
fila.Descripcion
			));
        }
        return lista;
    } // xxx Fin de Select
	//Insert
	public int Insert(Com_Planilla_Deposito n)
    {
        int res;
        try {
            res = Adapter.Insert(
				n.Fis_Planilla_Id,
n.Codigo_Deposito,
n.Fecha_Deposito,
n.Comprobante_Ctbl,
n.Valor,
n.Valor_Interes,
n.Descripcion
			);
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    } // xxx Fin de Insert
	//Delete
	public int Delete(Com_Planilla_Deposito o)
    {
        int res;
        try { 
            res = Adapter.Delete(
                    o.Id,
o.Fis_Planilla_Id,
o.Codigo_Deposito,
o.Fecha_Deposito,
o.Comprobante_Ctbl,
o.Valor,
o.Valor_Interes,
o.Descripcion
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Delete
	//Update
	public int Update(Com_Planilla_Deposito o, Com_Planilla_Deposito n)
    {
        int res;
        try
        {
            res = Adapter.Update(
                    n.Fis_Planilla_Id,
n.Codigo_Deposito,
n.Fecha_Deposito,
n.Comprobante_Ctbl,
n.Valor,
n.Valor_Interes,
n.Descripcion,
o.Id,
o.Fis_Planilla_Id,
o.Codigo_Deposito,
o.Fecha_Deposito,
o.Comprobante_Ctbl,
o.Valor,
o.Valor_Interes,
o.Descripcion,
n.Id
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Update
	// GetByFis_Planilla_Id
		public List<Com_Planilla_Deposito> GetByFis_Planilla_Id (Scope s , string p_Fis_Planilla_Id)
		{
			List<Com_Planilla_Deposito> lista = new List<Com_Planilla_Deposito>();
			var tabla = Adapter.GetByFis_Planilla_Id( p_Fis_Planilla_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Com_Planilla_Deposito(
				fila.Id,
fila.Fis_Planilla_Id,
fila.Codigo_Deposito,
fila.Fecha_Deposito,
fila.Comprobante_Ctbl,
fila.Valor,
fila.Valor_Interes,
fila.Descripcion
				));
			}
			return lista;
		}
		// GetById
		public List<Com_Planilla_Deposito> GetById (Scope s , Int32 p_Id)
		{
			List<Com_Planilla_Deposito> lista = new List<Com_Planilla_Deposito>();
			var tabla = Adapter.GetById( p_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Com_Planilla_Deposito(
				fila.Id,
fila.Fis_Planilla_Id,
fila.Codigo_Deposito,
fila.Fecha_Deposito,
fila.Comprobante_Ctbl,
fila.Valor,
fila.Valor_Interes,
fila.Descripcion
				));
			}
			return lista;
		}
		// InsertINT
		public int InsertINT(Com_Planilla_Deposito n)
    {
        int res;
        try {
            res = Convert.ToInt16( Adapter.InsertINT(
				n.Fis_Planilla_Id,
n.Codigo_Deposito,
n.Fecha_Deposito,
n.Comprobante_Ctbl,
n.Valor,
n.Valor_Interes,
n.Descripcion
			));
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    }
	}
}
