package pl.machnio.shoppingList.pdf;

import com.lowagie.text.*;
import com.lowagie.text.Font;
import com.lowagie.text.pdf.*;

import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.io.IOException;
import java.util.Map;

public class IngredientsWithQuantitiesPDFExporter {

    private Map<String, Integer> shoppingList;

    public IngredientsWithQuantitiesPDFExporter(Map<String, Integer> shoppingList) {
        this.shoppingList = shoppingList;
    }

    private void writeTableHeader(PdfPTable pdfPTable) throws IOException {
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(Color.decode("#ff6600"));
        cell.setPadding(5);
//        cell.setVerticalAlignment(Element.ALIGN_CENTER);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);


        BaseFont bf = BaseFont.createFont("C:\\Users\\machn\\OneDrive\\Pulpit\\JAVA weekendowo\\advanced-shopping-list\\src\\main\\resources\\fonts\\FreeSans.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

        cell.setPhrase(new Phrase(" TESTING 2 \u015Fi ", new Font(bf, 15)));
//        cell.setPhrase(new Phrase("Testing of letters \u010c,\u0106,\u0160,\u017d,\u0110", f1));
//        cell.setPhrase(new Phrase("produkt", font));
        pdfPTable.addCell(cell);

        cell.setPhrase(new Phrase("ilość", new Font(bf, 15)));
//        cell.setPhrase(new Phrase("ilość", f1));
//        cell.setPhrase(new Phrase("ilość", font));
        pdfPTable.addCell(cell);
    }

    private void writeTableData(PdfPTable pdfPTable) {
        shoppingList.forEach((s, integer) -> {
            pdfPTable.addCell(s);
            pdfPTable.addCell(integer + " gram");
        });
    }

    public void export(HttpServletResponse response) throws IOException {
        Document document = new Document(PageSize.A4);
        PdfWriter.getInstance(document, response.getOutputStream());
        document.open();

        Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD, "UTF-8", 20);
        font.setColor(Color.decode("#5a615f"));


        Paragraph title = new Paragraph("Lista zakźśćupów", font);
        title.setAlignment(Paragraph.ALIGN_CENTER);
        document.add(title);

        PdfPTable pdfPTable = new PdfPTable(2);
        pdfPTable.setWidthPercentage(50);
        pdfPTable.setSpacingBefore(15);
        pdfPTable.setHorizontalAlignment(1);
        pdfPTable.setWidths(new float[] {3f, 1.5f});

        writeTableHeader(pdfPTable);
        writeTableData(pdfPTable);

        document.add(pdfPTable);

        document.close();
    }
}
