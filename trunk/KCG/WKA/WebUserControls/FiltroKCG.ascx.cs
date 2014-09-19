using System;
using System.ComponentModel;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class WebUserControls_FiltroKCG : System.Web.UI.UserControl
{
    private object _dataSource;

    public object DataSource
    {
        get { return _dataSource; }
        set
        {
            if( value != null )
                ValidateDataSource(value);
            _dataSource = value;
            OnDataPropertyChanged();
        }
    }

    protected virtual void ValidateDataSource(object dataSource)
    {
        if(!((dataSource is IDataSource) ||
            (dataSource is IEnumerable ) ||
            (dataSource is IListSource)))
            throw ( new InvalidOperationException("Control no permintido como data source "
                + dataSource.GetType().ToString()));
    }

    protected virtual void OnDataPropertyChanged()
    {

    }


    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
