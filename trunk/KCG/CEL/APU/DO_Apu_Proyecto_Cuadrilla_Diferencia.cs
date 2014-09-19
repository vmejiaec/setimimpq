
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.ApuTableAdapters;
using AEL.APU;
using BEL;

namespace CEL.APU
{
/// <summary>
/// Acceso a la base de datos
/// Modulo:Apu target
/// Tabla:Apu_Proyecto_Cuadrilla_Diferencia
/// </summary>
public class DO_Apu_Proyecto_Cuadrilla_Diferencia
{
#region Adapter
private Apu_Proyecto_Cuadrilla_DiferenciaTableAdapter _Adapter;
/// <summary>
/// Acceso al Table Adapter de la capa ADL
/// </summary>
public Apu_Proyecto_Cuadrilla_DiferenciaTableAdapter Adapter
{
get
{
if (_Adapter == null)
_Adapter = new Apu_Proyecto_Cuadrilla_DiferenciaTableAdapter();
 return _Adapter;
 }
 }
#endregion
#region Obtención de datos
//Obtencion de datos
/// <summary>
/// Obtiene todos los datos de la tabla Apu_Proyecto_Cuadrilla_Diferencia
/// </summary> 
/// <returns>Lista de objetos Apu_Proyecto_Cuadrilla_Diferencia</returns> 
public List <Apu_Proyecto_Cuadrilla_Diferencia> Get ( Scope s )
{
string llamada = "";
List <Apu_Proyecto_Cuadrilla_Diferencia> lista= new List <Apu_Proyecto_Cuadrilla_Diferencia> ();
//Extrae los datos
if(s != null)
{
Apu.Apu_Proyecto_Cuadrilla_DiferenciaDataTable tabla = 
Adapter.Get ();
//Cuenta  el número  de registros de la tabla
int numeroRegistros = tabla.Count;
llamada = "Nombre del Método Utilizado: Get "  + "Parametros  Enviados en el Método: s "  + " Nombre del Store Procedure: " + " Apu_Proyecto_Cuadrilla_Diferencia_Get "+ " Número de Registros: " + numeroRegistros;
//Carga en la lista
  foreach (Apu.Apu_Proyecto_Cuadrilla_DiferenciaRow fila in tabla)
  lista.Add(new Apu_Proyecto_Cuadrilla_Diferencia(
  
fila.Apu_Proyecto_Id,
fila.Apu_proyecto_Codigo,
fila.Apu_proyecto_Nombre,
fila.Apu_proyecto_Etapa,
fila.Apu_Cuadrilla_Codigo,
fila.Apu_Cuadrilla_Nombre,
fila.costo_total,
fila.Costo_Hora,
fila.Numero_trabajadores,
fila.Coeficiente));
  }
  //Devuleve la Lista
  return lista;
  }
#endregion
 #region Consultas
    public List<Apu_Proyecto_Cuadrilla_Diferencia> GetByProyecto(Scope s, string apu_proyecto_id)
      {
      string llamada = "";
      List <Apu_Proyecto_Cuadrilla_Diferencia> lista= new List <Apu_Proyecto_Cuadrilla_Diferencia> ();
      //Extrae los datos
      if(s != null)
      {
      Apu.Apu_Proyecto_Cuadrilla_DiferenciaDataTable tabla =
      Adapter.GetByProyecto(apu_proyecto_id, s.Int_Empresa_Id);
      //Cuenta  el número  de registros de la tabla
      int numeroRegistros = tabla.Count;
      llamada = "Nombre del Método Utilizado: " + " GetByProyecto" + " Parametros  Enviados en el Método: " + "," + " int_empresa_id : " + s.Int_Empresa_Id + "," + " apu_proyecto_id : " + apu_proyecto_id + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_Cuadrilla_Diferencia_ByProyecto " + " Número de Registros: " + numeroRegistros;
      //Carga en la lista
      foreach (Apu.Apu_Proyecto_Cuadrilla_DiferenciaRow fila in tabla)
      lista.Add(new Apu_Proyecto_Cuadrilla_Diferencia(

        fila.Apu_Proyecto_Id,
        fila.Apu_proyecto_Codigo,
        fila.Apu_proyecto_Nombre,
        fila.Apu_proyecto_Etapa,
        fila.Apu_Cuadrilla_Codigo,
        fila.Apu_Cuadrilla_Nombre,
        fila.costo_total,
        fila.Costo_Hora,
        fila.Numero_trabajadores,
        fila.Coeficiente));
      }
   
      //Devuleve la Lista
      return lista;
      }

      #endregion

}

}


