<%-- 
    Document   : caisse-choix
    Created on : 22 mars 2024, 15:29:55
    Author     : Angela
--%>


<%@page import="utils.ConstanteStation"%>
<%@page import="magasin.MagasinLib"%>
<%@page import="caisse.CaisseCpl"%>
<%@page import="annexe.Unite"%>
<%@page import="annexe.Categorie"%>
<%@page import="affichage.PageRechercheChoix"%>
<%@page import="affichage.Liste"%> 


<%
    String champReturn = request.getParameter("champReturn");
    MagasinLib choix = new MagasinLib();
    String listeCrt[] = {"id", "val","desce","idpointlib","idTypeMagasinlib","idProduitlib"};
    String listeInt[] = {};
    String libEntete[] = {"id", "val","desce","idpointlib","idTypeMagasinlib","idProduitlib"};
    int range = 2;
    PageRechercheChoix pr = new PageRechercheChoix(choix, request, listeCrt, listeInt, range, libEntete, libEntete.length);
    pr.setAWhere("AND IDPOINT='"+ConstanteStation.getFichierCentre()+"'");
    pr.setTitre("Page choix");
    pr.setUtilisateur((user.UserEJB) session.getValue("u"));
    pr.setLien((String) session.getValue("lien"));
    pr.setApres("magasin/magasin-choix.jsp");
    pr.setChampReturn(champReturn);

    pr.getFormu().getChamp("id").setLibelle("Id");
    pr.getFormu().getChamp("val").setLibelle("Libell&eacute;");
    pr.getFormu().getChamp("desce").setLibelle("D&eacute;scription");
    pr.getFormu().getChamp("idpointlib").setLibelle("Point");
    pr.getFormu().getChamp("idTypeMagasinlib").setLibelle("Type");
    pr.getFormu().getChamp("idProduitlib").setLibelle("Produit");

    String[] colSomme = null;
    pr.creerObjetPage(libEntete, colSomme);
     String libEnteteAffiche[] = {"Id", "Libell&eacute;","D&eacute;scription","Point","Type","Produit"};
    pr.getTableau().setLibeEntete(libEnteteAffiche);
%>
<html>
    <head>
        <meta charset="UTF-8">
        <title><%= pr.getTitre()%></title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <jsp:include page='./../../elements/css.jsp'/>
    </head>
    <body class="skin-blue sidebar-mini">
        <div class="wrapper">
            <section class="content-header">
                <h1><%= pr.getTitre()%></h1>
            </section>
            <section class="content">
                <form action="<%=pr.getApres()%>?champReturn=<%=champReturn%>" method="post" name="fcdetailsliste" id="fcdetailsliste">
                    <% out.println(pr.getFormu().getHtmlEnsemble());%>
                </form>
                <form action="./../apresChoix.jsp" method="post" name="frmchx" id="frmchx">
                    <input type="hidden" name="champReturn" value="<%=pr.getChampReturn()%>">
                    <%

                        out.println(pr.getTableau().getHtmlWithRadioButton()); %>
                </form>
                <% out.println(pr.getBasPage());%>
            </section>
        </div>
        <jsp:include page='./../../elements/js.jsp'/>
    </body>
</html>