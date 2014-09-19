using AEL.APU;

namespace DEL.APU
{
    #region Fabrica de objetos
    public class APU_Factory
    {
        public static Apu_Proyecto_Rubro_Material Make_Apu_Proyecto_Rubro_Material(
            Apu_Proyecto_Rubro oProyRub, Apu_Rubro_Material oRubMat)
        {
            Apu_Proyecto_Rubro_Material o =
                new Apu_Proyecto_Rubro_Material();
            o.Apu_Proyecto_Rubro_Id = oProyRub.Id;
            o.Apu_Material_Id = oRubMat.Apu_Material_Id;
            o.Cantidad = oRubMat.Cantidad;
            o.Apu_Proyecto_Id = oProyRub.Apu_Proyecto_Id;
            return o;
        }

        public static Apu_Proyecto_Rubro_Mano_Obra Make_Apu_Proyecto_Rubro_Mano_Obra(
            Apu_Proyecto_Rubro oProyRub, Apu_Rubro_Mano_Obra oRubMan)
        {
            Apu_Proyecto_Rubro_Mano_Obra o =
                new Apu_Proyecto_Rubro_Mano_Obra();
            o.Apu_Proyecto_Rubro_Id = oProyRub.Id;
            o.Apu_Mano_Obra_Id = oRubMan.Apu_Mano_Obra_Id;
            o.Cantidad = oRubMan.Cantidad;
            o.Apu_Proyecto_Id = oProyRub.Apu_Proyecto_Id;
            return o;
        }

        public static Apu_Proyecto_Rubro_Equipo Make_Apu_Proyecto_Rubro_Equipo(
            Apu_Proyecto_Rubro oProyRub, Apu_Rubro_Equipo oRubEqu)
        {
            Apu_Proyecto_Rubro_Equipo o =
                new Apu_Proyecto_Rubro_Equipo();
            o.Apu_Proyecto_Rubro_Id = oProyRub.Id;
            o.Apu_Equipo_Id = oRubEqu.Apu_Equipo_Id;
            o.Cantidad = oRubEqu.Cantidad;
            o.Apu_Proyecto_Id = oProyRub.Apu_Proyecto_Id;
            return o;
        }

        public static Apu_Proyecto_Rubro_Documento Make_Apu_Proyecto_Rubro_Documento(
            Apu_Proyecto_Rubro oProyRub, Apu_Rubro_Documento oRubDoc)
        {
            Apu_Proyecto_Rubro_Documento o =
                new Apu_Proyecto_Rubro_Documento();
            o.Apu_Proyecto_Rubro_Id = oProyRub.Id;
            o.Nombre = oRubDoc.Nombre;
            o.Ruta = oRubDoc.Ruta;
            o.Descripcion = oRubDoc.Descripcion;
            return o;
        }

        public static Apu_Proyecto_Rubro_Tecnica Make_Apu_Proyecto_Rubro_Tecnica(
            Apu_Proyecto_Rubro oProyRub, Apu_Rubro_Tecnica oRubTec)
        {
            Apu_Proyecto_Rubro_Tecnica o =
                new Apu_Proyecto_Rubro_Tecnica();
            o.Apu_Proyecto_Rubro_Id = oProyRub.Id;
            o.Imagen = oRubTec.Imagen;
            o.Origen_Imagen = oRubTec.Origen_Imagen;
            o.Definicion = oRubTec.Definicion;
            o.Especificacion = oRubTec.Especificacion;
            o.Medicion = oRubTec.Medicion;
            return o;
        }

        public static Apu_Oferta_Material Make_Apu_Oferta_Material(
            Apu_Oferta_Rubro_Material oRubMat)
        {
            Apu_Oferta_Material o =
                new Apu_Oferta_Material();
            o.Apu_Oferta_Id = oRubMat.Apu_Oferta_Id;
            o.Apu_Material_Id = oRubMat.Apu_Material_Id;
            return o;
        }

    }
    #endregion
}
