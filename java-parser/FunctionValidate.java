import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import org.antlr.v4.gui.TreeViewer;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CodePointCharStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

public class FunctionValidate {
    public static void main(String[] args) throws IOException
    {
        if (args.length == 0)
        {
            System.out.println("Antlr Java parser.");
            return;
        }
        int exceptions = 0;
		ErrorListener errorListener = new ErrorListener();
        try
        {
            File file = new File(args[0]);
            FileInputStream input = null;
            input = new FileInputStream(file);
            ANTLRInputStream str = new ANTLRInputStream(input);
            JavaLexer lexer = new JavaLexer(str);
            CommonTokenStream tokens = new CommonTokenStream(lexer);
            JavaParser parser = new JavaParser(tokens);
            parser.removeErrorListeners();
            parser.addErrorListener(errorListener);
            ParseTree tree = parser.compilationUnit();
        }
        catch (Exception e)
        {
            exceptions++;
        }
        System.out.println("errors " + errorListener.num_errors + " exceptions " + exceptions);
    }
}
