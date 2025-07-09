
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.util.Scanner;

public class UdpClient
{
    public static void main(String args[]) throws IOException
    {
        Scanner sc = new Scanner(System.in);

        // Step 1:Create the socket object
        DatagramSocket ds = new DatagramSocket();

        InetAddress ip = InetAddress.getLocalHost();
        byte buf[] = null;

        while (true)
        {
            String inp = sc.nextLine();

            buf = inp.getBytes();

            // Step 2 : Create the datagramPacket for sending the data.
            DatagramPacket DpSend =
                  new DatagramPacket(buf, buf.length, ip, 1234);

            // Step 3 : invoke the send call to actually send the data.
            ds.send(DpSend);

            
            if (inp.equals("bye"))
                break;
        }
    }
}