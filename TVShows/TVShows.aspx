<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TVShows.aspx.cs" Inherits="TVShows.TVShows" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Top 100 TV Shows</title>
    <link type="text/css" rel="Stylesheet" href="Styles/TVShows.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>Top 100 TV Shows to watch on Catch-up</h1>
    <h2>(according to the Radio Times - January 2015)</h2>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:TVShowsConnectionString %>" 
            SelectCommand="SELECT * FROM [Top100TVShows]" 
            DeleteCommand="DELETE FROM [Top100TVShows] WHERE [TVShowID] = @TVShowID" 
            InsertCommand="INSERT INTO [Top100TVShows] ([Position], [Title], [NoOfSeries], [NoOfEpisodes], [WantToWatch], [Watched], [IMDb]) VALUES (@Position, @Title, @NoOfSeries, @NoOfEpisodes, @WantToWatch, @Watched, @IMDb)" 
            UpdateCommand="UPDATE [Top100TVShows] SET [Position] = @Position, [Title] = @Title, [NoOfSeries] = @NoOfSeries, [NoOfEpisodes] = @NoOfEpisodes, [WantToWatch] = @WantToWatch, [Watched] = @Watched, [IMDb] = @IMDb WHERE [TVShowID] = @TVShowID">
            <DeleteParameters>
                <asp:Parameter Name="TVShowID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Position" Type="Int32" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="NoOfSeries" Type="Int32" />
                <asp:Parameter Name="NoOfEpisodes" Type="Int32" />
                <asp:Parameter Name="WantToWatch" Type="Boolean" />
                <asp:Parameter Name="Watched" Type="Boolean" />
                <asp:Parameter Name="IMDb" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Position" Type="Int32" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="NoOfSeries" Type="Int32" />
                <asp:Parameter Name="NoOfEpisodes" Type="Int32" />
                <asp:Parameter Name="WantToWatch" Type="Boolean" />
                <asp:Parameter Name="Watched" Type="Boolean" />
                <asp:Parameter Name="IMDb" Type="String" />
                <asp:Parameter Name="TVShowID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="TVShowID" DataSourceID="SqlDataSource1" 
            ForeColor="#333333" GridLines="None" AllowPaging="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Position" HeaderText="Position" 
                    SortExpression="Position" >
                <ItemStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:ImageField DataImageUrlField="Position" 
                    DataImageUrlFormatString="Images/{0}.jpg" 
                    AlternateText="No image available.">
                </asp:ImageField>
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" >
                <ItemStyle Font-Bold="True" />
                </asp:BoundField>
                <asp:BoundField DataField="NoOfSeries" HeaderText="No. of Series" 
                    SortExpression="NoOfSeries" />
                <asp:BoundField DataField="NoOfEpisodes" HeaderText="No. of Episodes" 
                    SortExpression="NoOfEpisodes" />
                <asp:CheckBoxField DataField="WantToWatch" HeaderText="Want to Watch" 
                    SortExpression="WantToWatch" />
                <asp:CheckBoxField DataField="Watched" HeaderText="Watched" 
                    SortExpression="Watched" />
                <asp:HyperLinkField DataNavigateUrlFields="IMDb" 
                    DataNavigateUrlFormatString="http://www.imdb.com/title/{0}" 
                    Text="&lt;img src='Images/IMDbLogo.jpg' alt='Link to IMDb' border='0'/&gt;" 
                    HeaderText="IMDb Link" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </div>
    </form>
</body>
</html>
