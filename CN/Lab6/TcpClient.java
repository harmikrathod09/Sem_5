import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;

public class TcpClient {
    private Socket s=null;
    private DataInputStream in=null;
    private DataOutputStream out=null;

    TcpClient(String addr, int port){
        try {
            s=new Socket(addr,port);
            System.out.println("Connected...");

            in=new DataInputStream(System.in);

            out=new DataOutputStream(s.getOutputStream());
        } catch (UnknownHostException e) {
           System.err.println(e);
           return;
        }
        catch(IOException i){
            System.out.println(i);
            return;
        }

        String m="";

        while (!m.equals("bye")) {
            try {
                m=in.readLine();
                out.writeUTF(m);
            } catch (IOException e) {
                System.out.println(e);
            }
        }

        try {
            in.close();
            out.close();
            s.close();
        } catch (IOException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        TcpClient c=new TcpClient("127.0.0.1", 5000);
    }
}
