import java.awt.*;
import java.awt.event.*;
import java.awt.geom.RoundRectangle2D;
import java.io.File;
import java.io.IOException;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.imageio.ImageIO;

public class LandingPage {
    private static Point mouseClickPoint;

    public static void main(String[] args) {
        SwingUtilities.invokeLater(LandingPage::createAndShowGUI);
    }

    private static void createAndShowGUI() {
        JFrame frame = new JFrame("SkyConnect");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(900, 600);
        frame.setLocationRelativeTo(null);
        frame.setUndecorated(true);
        frame.setShape(new RoundRectangle2D.Double(0, 0, 900, 600, 30, 30));

        setAppIcon(frame);
        addEscapeKeyClose(frame);
        addFadeInEffect(frame);

        JPanel backgroundPanel = buildBackgroundPanel(frame);
        frame.setContentPane(backgroundPanel);
        frame.setVisible(true);
    }

    private static void setAppIcon(JFrame frame) {
        try {
            Image icon = ImageIO.read(new File("assets/skyconnect-icon.png"));
            frame.setIconImage(icon);
        } catch (IOException e) {
            System.err.println("Icon not found. Skipping icon load.");
        }
    }

    private static void addEscapeKeyClose(JFrame frame) {
        JRootPane rootPane = frame.getRootPane();
        KeyStroke escapeKey = KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0);
        rootPane.getInputMap(JComponent.WHEN_IN_FOCUSED_WINDOW).put(escapeKey, "ESCAPE");
        rootPane.getActionMap().put("ESCAPE", new AbstractAction() {
            @Override
            public void actionPerformed(ActionEvent e) {
                frame.dispose();
            }
        });
    }

    private static void addFadeInEffect(JFrame frame) {
        frame.setOpacity(0f);
        Timer fadeIn = new Timer(25, null);
        fadeIn.addActionListener(e -> {
            float opacity = frame.getOpacity();
            if (opacity < 1f) {
                frame.setOpacity(Math.min(opacity + 0.04f, 1f));
            } else {
                ((Timer) e.getSource()).stop();
            }
        });
        fadeIn.start();
    }

    private static JPanel buildBackgroundPanel(JFrame frame) {
        JPanel backgroundPanel = new JPanel() {
            @Override
            protected void paintComponent(Graphics g) {
                super.paintComponent(g);
                Graphics2D g2d = (Graphics2D) g;
                GradientPaint gp = new GradientPaint(0, 0, new Color(0, 94, 184),
                        0, getHeight(), new Color(100, 200, 255));
                g2d.setPaint(gp);
                g2d.fillRect(0, 0, getWidth(), getHeight());
            }
        };
        backgroundPanel.setLayout(new GridBagLayout());

        // Draggable window
        backgroundPanel.addMouseListener(new MouseAdapter() {
            public void mousePressed(MouseEvent e) {
                mouseClickPoint = e.getPoint();
            }
        });
        backgroundPanel.addMouseMotionListener(new MouseMotionAdapter() {
            public void mouseDragged(MouseEvent e) {
                Point curr = e.getLocationOnScreen();
                frame.setLocation(curr.x - mouseClickPoint.x, curr.y - mouseClickPoint.y);
            }
        });

        // Glass panel
        JPanel glassPanel = new JPanel() {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.3f));
                g2.setColor(Color.WHITE);
                g2.fillRoundRect(0, 0, getWidth(), getHeight(), 30, 30);
                g2.dispose();
                super.paintComponent(g);
            }
        };
        glassPanel.setOpaque(false);
        glassPanel.setLayout(new BoxLayout(glassPanel, BoxLayout.Y_AXIS));
        glassPanel.setBorder(new EmptyBorder(60, 40, 60, 40));
        glassPanel.setPreferredSize(new Dimension(520, 340));

        // Add components
        glassPanel.add(createLabel("✈ Welcome to <span style='color:#ffffff;'>SkyConnect</span>", 34, true));
        glassPanel.add(Box.createRigidArea(new Dimension(0, 20)));
        glassPanel.add(createLabel("👉 Your journey begins here.", 20, false));
        glassPanel.add(Box.createRigidArea(new Dimension(0, 40)));
        glassPanel.add(createContinueButton(frame));

        backgroundPanel.add(glassPanel);
        return backgroundPanel;
    }

    private static JLabel createLabel(String text, int fontSize, boolean bold) {
        JLabel label = new JLabel("<html><div style='text-align: center;'>" + text + "</div></html>");
        label.setFont(new Font("Segoe UI", bold ? Font.BOLD : Font.PLAIN, fontSize));
        label.setForeground(Color.WHITE);
        label.setAlignmentX(Component.CENTER_ALIGNMENT);
        return label;
    }

    private static JButton createContinueButton(JFrame frame) {
        JButton button = new JButton("👉 CONTINUE");
        button.setFont(new Font("Segoe UI", Font.BOLD, 18));
        button.setBackground(Color.WHITE);
        button.setForeground(new Color(0, 94, 184));
        button.setFocusPainted(false);
        button.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        button.setAlignmentX(Component.CENTER_ALIGNMENT);
        button.setBorder(BorderFactory.createLineBorder(new Color(0, 94, 184), 2, true));
        button.setMaximumSize(new Dimension(240, 50));

        button.addMouseListener(new MouseAdapter() {
            public void mouseEntered(MouseEvent e) {
                button.setBackground(new Color(230, 245, 255));
            }

            public void mouseExited(MouseEvent e) {
                button.setBackground(Color.WHITE);
            }
        });

        button.addActionListener(e -> {
            try {
                Desktop.getDesktop().browse(new File("index.html").toURI());
                frame.dispose();
            } catch (IOException ex) {
                JOptionPane.showMessageDialog(frame, "Failed to open index.html", "Error", JOptionPane.ERROR_MESSAGE);
            }
        });

        return button;
    }
}
