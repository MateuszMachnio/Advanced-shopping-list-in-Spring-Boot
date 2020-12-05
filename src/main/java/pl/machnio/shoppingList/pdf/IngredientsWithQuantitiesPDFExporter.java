package pl.machnio.shoppingList.pdf;

import com.lowagie.text.*;
import com.lowagie.text.Font;
import com.lowagie.text.pdf.*;
import pl.machnio.shoppingList.entity.shoppingListCreating.ShoppingList;

import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.io.IOException;
import java.util.Map;

public class IngredientsWithQuantitiesPDFExporter {

    private ShoppingList shoppingList;

    public IngredientsWithQuantitiesPDFExporter(ShoppingList shoppingList) {
        this.shoppingList = shoppingList;
    }

    private void writeTableHeader(PdfPTable pdfPTable) throws IOException {
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(Color.decode("#ff6600"));
        cell.setPadding(8);
        cell.setPaddingTop(0);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);

        BaseFont bf = BaseFont.createFont("C:\\Users\\machn\\OneDrive\\Pulpit\\JAVA weekendowo\\advanced-shopping-list\\src\\main\\resources\\fonts\\FreeSans.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

        Font font = new Font(bf, 18);
        font.setColor(Color.WHITE);

        cell.setPhrase(new Phrase("produkt", font));
        pdfPTable.addCell(cell);


        cell.setPhrase(new Phrase("ilość", font));
        pdfPTable.addCell(cell);
    }

    private void writeTableData(PdfPTable pdfPTable) throws IOException {
        PdfPCell cell = new PdfPCell();
        cell.setPadding(8);
        cell.setPaddingTop(0);

        BaseFont bf = BaseFont.createFont("C:\\Users\\machn\\OneDrive\\Pulpit\\JAVA weekendowo\\advanced-shopping-list\\src\\main\\resources\\fonts\\OrganicTeabags.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        Font font = new Font(bf,18);

        shoppingList.getIngredientsWithQuantities().forEach(ingredientWithQuantity -> {
//            font.setSize(25);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setPhrase(new Phrase(ingredientWithQuantity.getIngredient().getName(), font));
            pdfPTable.addCell(cell);

//            font.setSize(15);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPhrase(new Phrase(ingredientWithQuantity.getQuantity() + " g", font));
            pdfPTable.addCell(cell);
        });
    }

    public void export(HttpServletResponse response) throws IOException {
        Document document = new Document(PageSize.A4);
        PdfWriter.getInstance(document, response.getOutputStream());
        document.open();

        BaseFont bf = BaseFont.createFont("C:\\Users\\machn\\OneDrive\\Pulpit\\JAVA weekendowo\\advanced-shopping-list\\src\\main\\resources\\fonts\\Allura-Regular.otf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        Font font = new Font(bf, 40);

        Paragraph title = new Paragraph("Lista zakupów", font);
        title.setAlignment(Paragraph.ALIGN_CENTER);
        document.add(title);

        PdfPTable pdfPTable = new PdfPTable(2);
        pdfPTable.setWidthPercentage(50);
        pdfPTable.setSpacingBefore(25);
        pdfPTable.setHorizontalAlignment(1);
        pdfPTable.setWidths(new float[] {3f, 1.5f});

        writeTableHeader(pdfPTable);
        writeTableData(pdfPTable);

        document.add(pdfPTable);

        document.close();
    }
}
