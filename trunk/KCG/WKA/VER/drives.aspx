<%@Page Language="C#" %>
<%@Import namespace="System.IO"%>
<html>
<head><title>Explorando Directorios  </title>
<style>
a.entry {
  font-family: "MS Sans Serif";
  font-size: 8pt;
  color: "black";
  text-decoration: none;
}
</style>
</head>
<body>
<%
  string[] arrDrives = Directory.GetLogicalDrives();
  for (int i=0; i<=arrDrives.Length-1; i++) {
      Response.Write("<img src='../Images/drive.gif' /><a href='browse.aspx?d=" + arrDrives[i] + "' class='entry'>" + arrDrives[i] + "</a><br>");
  }
%>

</body>
</html>