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
            Image icon = ImageIO.read(new File("assets/skyconnect-logo.png"));
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
        Image backgroundImage = null;
        try {
            backgroundImage = ImageIO.read(new File("assets/skybackground.jpg"));
        } catch (IOException e) {
            System.err.println("Background image not found.");
        }

        final Image finalBackgroundImage = backgroundImage;

        JPanel backgroundPanel = new JPanel() {
            @Override
            protected void paintComponent(Graphics g) {
                super.paintComponent(g);
                if (finalBackgroundImage != null) {
                    g.drawImage(finalBackgroundImage, 0, 0, getWidth(), getHeight(), this);
                } else {
                    Graphics2D g2d = (Graphics2D) g;
                    GradientPaint gp = new GradientPaint(0, 0, new Color(0, 94, 184),
                            0, getHeight(), new Color(100, 200, 255));
                    g2d.setPaint(gp);
                    g2d.fillRect(0, 0, getWidth(), getHeight());
                }
            }
        };
        backgroundPanel.setLayout(new GridBagLayout());

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

        // Add logo independently to backgroundPanel
        GridBagConstraints logoConstraints = new GridBagConstraints();
        logoConstraints.gridx = 0;
        logoConstraints.gridy = 0;
        logoConstraints.insets = new Insets(40, 0, 20, 0); // Adjust this to move logo up/down
        logoConstraints.anchor = GridBagConstraints.CENTER;

        try {
            Image logoImage = ImageIO.read(new File("assets/skyconnect-logo.png"));
            Image scaledLogo = logoImage.getScaledInstance(100, 100, Image.SCALE_SMOOTH);
            JLabel logoLabel = new JLabel(new ImageIcon(scaledLogo));
            backgroundPanel.add(logoLabel, logoConstraints);
        } catch (IOException e) {
            System.err.println("Logo not found.");
        }

        // Build glass panel
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
        glassPanel.setBorder(new EmptyBorder(150, 40, 60, 40)); // Top padding reduced
        glassPanel.setPreferredSize(new Dimension(520, 380));

        glassPanel.add(createLabel("✈ Welcome to <span style='color:#ffffff;'>SkyConnect</span>", 30, true));
        glassPanel.add(Box.createRigidArea(new Dimension(0, 25)));
        glassPanel.add(createLabel("Your journey begins here.", 22, false));
        glassPanel.add(Box.createRigidArea(new Dimension(0, 30)));
        glassPanel.add(createContinueButton(frame));

        // Add glassPanel below the logo
        GridBagConstraints panelConstraints = new GridBagConstraints();
        panelConstraints.gridx = 0;
        panelConstraints.gridy = 1;
        panelConstraints.anchor = GridBagConstraints.CENTER;
        backgroundPanel.add(glassPanel, panelConstraints);

        return backgroundPanel;
    }

    private static JLabel createLabel(String text, int fontSize, boolean bold) {
        JLabel label = new JLabel("<html>" + text + "</html>");
        label.setFont(new Font("Segoe UI", bold ? Font.BOLD : Font.PLAIN, fontSize));
        label.setForeground(Color.WHITE);
        label.setAlignmentX(Component.CENTER_ALIGNMENT);
        label.setHorizontalAlignment(SwingConstants.CENTER);
        return label;
    }

    private static JButton createContinueButton(JFrame frame) {
        JButton button = new JButton("CONTINUE");
        button.setFont(new Font("Segoe UI", Font.BOLD, 18));
        button.setBackground(Color.WHITE);
        button.setForeground(new Color(0, 94, 184));
        button.setFocusPainted(false);
        button.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        button.setAlignmentX(Component.CENTER_ALIGNMENT);
        button.setPreferredSize(new Dimension(320, 60));
        button.setBorder(BorderFactory.createLineBorder(new Color(0, 94, 184), 2, true));

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
