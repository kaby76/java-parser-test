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
        boolean print_tree = false;
        int file_index = 0;
        if (args.length == 0)
        {
            System.out.println("Antlr Java parser.");
            return;
        }
        else
        {
            for (int i = 0; i < args.length; ++i)
            {
                if (args[i] == "-t")
                {
                    print_tree = true;
                }
                else
                {
                    file_index = i;
                }
            }
        }
        int exceptions = 0;
        ErrorListener errorListener = new ErrorListener();
        ParseTree tree = null;
        CommonTokenStream tokens = null;
        try
        {
            File file = new File(args[file_index]);
            FileInputStream input = null;
            input = new FileInputStream(file);
            ANTLRInputStream str = new ANTLRInputStream(input);
            JavaLexer lexer = new JavaLexer(str);
            tokens = new CommonTokenStream(lexer);
            JavaParser parser = new JavaParser(tokens);
            parser.removeErrorListeners();
            parser.addErrorListener(errorListener);
            tree = parser.compilationUnit();
        }
        catch (Exception e)
        {
            exceptions++;
        }
        System.out.println("errors " + errorListener.num_errors + " exceptions " + exceptions);
        Output output = new Output();
        if (tree != null) System.out.println(output.OutputTree(tree, tokens));
    }
}
