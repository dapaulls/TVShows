<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListView.aspx.cs" Inherits="TVShows.ListView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Top 100 TV Shows</title>
    <link type="text/css" rel="Stylesheet" href="Styles/TVShows.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1 align="center">Top 100 TV Shows to watch on Catch-up</h1>
    <h2 align="center">(according to the Radio Times - January 2015)</h2>
        <asp:SqlDataSource ID="Top100TVShowsSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:TVShowsConnectionString %>" 
            
            SelectCommand="SELECT * FROM [Top100TVShows] ORDER BY [Position]">
        </asp:SqlDataSource>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="TVShowID" 
            DataSourceID="Top100TVShowsSqlDataSource" GroupItemCount="3">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color:#FFF8DC;" align="center" valign="top">
                    <asp:Label ID="PositionLabel" runat="server" Text='<%# Eval("Position") %>' Font-Bold="True" />.
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' Font-Bold="True" />
                    <br /><br />
                    <asp:HyperLink ID="IMDbHyperLink" runat="server" ToolTip="Go to IMDb Page" 
                    ImageUrl='<%#"~/images/" + Eval("IMDb") + ".jpg" %>' 
                    NavigateUrl='<%# "http://www.imdb.com/title/" + Eval("IMDb") %>' target="_blank" Width="250px">HyperLink</asp:HyperLink>
                    Number of Series:
                    <asp:Label ID="NoOfSeriesLabel" runat="server" Text='<%# Eval("NoOfSeries") %>' />
                    <br />
                    Number of Episodes:
                    <asp:Label ID="NoOfEpisodesLabel" runat="server" Text='<%# Eval("NoOfEpisodes") %>' />
                    <br />
                    Want to Watch:
                    <asp:CheckBox ID="WantToWatchCheckBox" runat="server" 
                        Checked='<%# Eval("WantToWatch") %>' Enabled="false" />
                    <br />
                    Watched:
                    <asp:CheckBox ID="WatchedCheckBox" runat="server" 
                        Checked='<%# Eval("Watched") %>' Enabled="false" />                 
                    <br /> 
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">
                    TVShowID:
                    <asp:Label ID="TVShowIDLabel1" runat="server" Text='<%# Eval("TVShowID") %>' />
                    <br />
                    Position:
                    <asp:TextBox ID="PositionTextBox" runat="server" 
                        Text='<%# Bind("Position") %>' />
                    <br />
                    Title:
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                    <br />
                    NoOfSeries:
                    <asp:TextBox ID="NoOfSeriesTextBox" runat="server" 
                        Text='<%# Bind("NoOfSeries") %>' />
                    <br />
                    NoOfEpisodes:
                    <asp:TextBox ID="NoOfEpisodesTextBox" runat="server" 
                        Text='<%# Bind("NoOfEpisodes") %>' />
                    <br />
                    <asp:CheckBox ID="WantToWatchCheckBox" runat="server" 
                        Checked='<%# Bind("WantToWatch") %>' Text="WantToWatch" />
                    <br />
                    <asp:CheckBox ID="WatchedCheckBox" runat="server" 
                        Checked='<%# Bind("Watched") %>' Text="Watched" />
                    <br />
                    IMDb:
                    <asp:TextBox ID="IMDbTextBox" runat="server" Text='<%# Bind("IMDb") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                    <br />
                </td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" 
                    
                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>
                            No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
                <td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr ID="itemPlaceholderContainer" runat="server">
                    <td ID="itemPlaceholder" runat="server">
                    </td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">
                    Position:
                    <asp:TextBox ID="PositionTextBox" runat="server" 
                        Text='<%# Bind("Position") %>' />
                    <br />
                    Title:
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                    <br />
                    NoOfSeries:
                    <asp:TextBox ID="NoOfSeriesTextBox" runat="server" 
                        Text='<%# Bind("NoOfSeries") %>' />
                    <br />
                    NoOfEpisodes:
                    <asp:TextBox ID="NoOfEpisodesTextBox" runat="server" 
                        Text='<%# Bind("NoOfEpisodes") %>' />
                    <br />
                    <asp:CheckBox ID="WantToWatchCheckBox" runat="server" 
                        Checked='<%# Bind("WantToWatch") %>' Text="WantToWatch" />
                    <br />
                    <asp:CheckBox ID="WatchedCheckBox" runat="server" 
                        Checked='<%# Bind("Watched") %>' Text="Watched" />
                    <br />
                    IMDb:
                    <asp:TextBox ID="IMDbTextBox" runat="server" Text='<%# Bind("IMDb") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                    <br />
                </td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color:#DCDCDC;color: #000000;" align="center" valign="top">
                    <asp:Label ID="PositionLabel" runat="server" Text='<%# Eval("Position") %>' Font-Bold="True" />.
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' Font-Bold="True" />
                    <br /><br />
                    <asp:HyperLink ID="IMDbHyperLink" runat="server" ToolTip="Go to IMDb Page" 
                    ImageUrl='<%#"~/images/" + Eval("IMDb") + ".jpg" %>' 
                    NavigateUrl='<%# "http://www.imdb.com/title/" + Eval("IMDb") %>' target="_blank" Width="250px">HyperLink</asp:HyperLink>
                    Number of Series:
                    <asp:Label ID="NoOfSeriesLabel" runat="server" Text='<%# Eval("NoOfSeries") %>' />
                    <br />
                    Number of Episodes:
                    <asp:Label ID="NoOfEpisodesLabel" runat="server" Text='<%# Eval("NoOfEpisodes") %>' />
                    <br />
                    Want to Watch:
                    <asp:CheckBox ID="WantToWatchCheckBox" runat="server" 
                        Checked='<%# Eval("WantToWatch") %>' Enabled="false" />
                    <br />
                    Watched:
                    <asp:CheckBox ID="WatchedCheckBox" runat="server" 
                        Checked='<%# Eval("Watched") %>' Enabled="false" />                 
                    <br />
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr id="Tr1" runat="server">
                        <td id="Td1" runat="server" 
                            style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager2" runat="server" PageSize="12">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                        ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server">
                            <table ID="groupPlaceholderContainer" runat="server" border="1" 
                                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr ID="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" 
                            style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                        ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" 
                    style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    TVShowID:
                    <asp:Label ID="TVShowIDLabel" runat="server" Text='<%# Eval("TVShowID") %>' />
                    <br />
                    Position:
                    <asp:Label ID="PositionLabel" runat="server" Text='<%# Eval("Position") %>' />
                    <br />
                    Title:
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                    <br />
                    NoOfSeries:
                    <asp:Label ID="NoOfSeriesLabel" runat="server" 
                        Text='<%# Eval("NoOfSeries") %>' />
                    <br />
                    NoOfEpisodes:
                    <asp:Label ID="NoOfEpisodesLabel" runat="server" 
                        Text='<%# Eval("NoOfEpisodes") %>' />
                    <br />
                    <asp:CheckBox ID="WantToWatchCheckBox" runat="server" 
                        Checked='<%# Eval("WantToWatch") %>' Enabled="false" Text="WantToWatch" />
                    <br />
                    <asp:CheckBox ID="WatchedCheckBox" runat="server" 
                        Checked='<%# Eval("Watched") %>' Enabled="false" Text="Watched" />
                    <br />
                    IMDb:
                    <asp:Label ID="IMDbLabel" runat="server" Text='<%# Eval("IMDb") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
    </div>
    </form>
</body>
</html>
