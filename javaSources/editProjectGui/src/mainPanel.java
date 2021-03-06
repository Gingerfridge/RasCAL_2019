/*
 * mainPanel.java
 *
 * Created on 04 January 2008, 11:00
 */

/**
 *
 * @author  Arwel
 */
public class mainPanel extends javax.swing.JPanel {
    
    /** Creates new form mainPanel */
    public mainPanel() {
        initComponents();
    }
    
    public javax.swing.JButton getAddContrastsButton() {
        return addContrastsButton;
    }
    
    public javax.swing.JLabel getCustomFileLabel() {
        return customFileLabel;
    }

    public javax.swing.JTextField getCustomFileTextField() {
        return customFileTextField;
    }
    
    public javax.swing.JComboBox getGeometryComboBox() {
        return geometryComboBox;
    }
    
    public javax.swing.JTextField getProjectNameTextField() {
        return getNameTextField();
    }
    
    
    public javax.swing.JTextField getNumberOfContrastsTextField() {
        return numberOfContrasts;
    }
    
    
    public javax.swing.JTextField getPathTextField() {
        return pathTextField;
    }
    
    public javax.swing.JButton getremoveContrastsButton() {
        return removeContrastsButton;
    }

    public javax.swing.JComboBox getTypeComboBox() {
        return typeComboBox;
    }

    public javax.swing.JTextField getNameTextField() {
        return nameTextField;
    }

    public javax.swing.JButton getCustomFileBrowse() {
        return customFileBrowse;
    }

    public javax.swing.JButton getCustomFileEdit() {
        return customFileEdit;
    }

    public javax.swing.JButton getCustomFileNew() {
        return customFileNew;
    }

    public javax.swing.JButton getExportModel() {
        return exportModel;
    }

    public javax.swing.JButton getImportModel() {
        return importModel;
    }
        
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        jLabel1 = new javax.swing.JLabel();
        pathTextField = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        nameTextField = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        typeComboBox = new javax.swing.JComboBox();
        jLabel4 = new javax.swing.JLabel();
        geometryComboBox = new javax.swing.JComboBox();
        jLabel5 = new javax.swing.JLabel();
        numberOfContrasts = new javax.swing.JTextField();
        addContrastsButton = new javax.swing.JButton();
        removeContrastsButton = new javax.swing.JButton();
        customFileLabel = new javax.swing.JLabel();
        customFileTextField = new javax.swing.JTextField();
        customFileEdit = new javax.swing.JButton();
        customFileNew = new javax.swing.JButton();
        customFileBrowse = new javax.swing.JButton();
        importModel = new javax.swing.JButton();
        exportModel = new javax.swing.JButton();

        jLabel1.setText("Project Path");

        pathTextField.setEditable(false);
        pathTextField.setHorizontalAlignment(javax.swing.JTextField.LEFT);
        pathTextField.setText("c:\\");

            jLabel2.setText("Project Name ");

            nameTextField.setEditable(false);
            nameTextField.setText("myProject");

            jLabel3.setText("Project Type");

            typeComboBox.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Standard Layers", "Custom Layers", "Custom XY Profile" }));

            jLabel4.setText("Experiment Geometry");

            geometryComboBox.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Air / Liquid (or solid)", "Solid / Liquid" }));

            jLabel5.setText("Number of Contrasts");

            numberOfContrasts.setEditable(false);
            numberOfContrasts.setHorizontalAlignment(javax.swing.JTextField.CENTER);
            numberOfContrasts.setText("1");

            addContrastsButton.setText("Add");

            removeContrastsButton.setText("Remove");

            customFileLabel.setText("Custom m-file");

            customFileTextField.setEditable(false);
            customFileTextField.setText("c:\\myFile");

            customFileEdit.setText("Edit");

            customFileNew.setText("New");

            customFileBrowse.setText("Browse");
            customFileBrowse.addActionListener(new java.awt.event.ActionListener() {
                public void actionPerformed(java.awt.event.ActionEvent evt) {
                    customFileBrowseActionPerformed(evt);
                }
            });

            importModel.setText("Import Model");
            importModel.addActionListener(new java.awt.event.ActionListener() {
                public void actionPerformed(java.awt.event.ActionEvent evt) {
                    importModelActionPerformed(evt);
                }
            });

            exportModel.setText("Export  Model");

            org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(this);
            this.setLayout(layout);
            layout.setHorizontalGroup(
                layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                .add(layout.createSequentialGroup()
                    .addContainerGap()
                    .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                        .add(org.jdesktop.layout.GroupLayout.TRAILING, layout.createSequentialGroup()
                            .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                                .add(jLabel3, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 104, Short.MAX_VALUE)
                                .add(jLabel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 104, Short.MAX_VALUE)
                                .add(jLabel4, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .add(jLabel2, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 104, Short.MAX_VALUE)
                                .add(jLabel5, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 104, Short.MAX_VALUE))
                            .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                            .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                                .add(layout.createSequentialGroup()
                                    .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING, false)
                                        .add(org.jdesktop.layout.GroupLayout.LEADING, geometryComboBox, 0, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                        .add(org.jdesktop.layout.GroupLayout.LEADING, typeComboBox, 0, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                        .add(org.jdesktop.layout.GroupLayout.LEADING, layout.createSequentialGroup()
                                            .add(numberOfContrasts, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 43, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                                            .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                                            .add(addContrastsButton)
                                            .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                                            .add(removeContrastsButton, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                                    .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                                    .add(customFileLabel, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 79, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                                    .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                                    .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                                        .add(layout.createSequentialGroup()
                                            .add(customFileNew, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 78, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                                            .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                                            .add(customFileBrowse)
                                            .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                                            .add(customFileEdit))
                                        .add(customFileTextField, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 212, Short.MAX_VALUE)))
                                .add(nameTextField, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 480, Short.MAX_VALUE)
                                .add(pathTextField, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 480, Short.MAX_VALUE)))
                        .add(layout.createSequentialGroup()
                            .add(importModel)
                            .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                            .add(exportModel)))
                    .addContainerGap())
            );
            layout.setVerticalGroup(
                layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                .add(layout.createSequentialGroup()
                    .add(25, 25, 25)
                    .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                        .add(jLabel1)
                        .add(pathTextField, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                    .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                    .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                        .add(jLabel2)
                        .add(nameTextField, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                    .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                    .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                        .add(jLabel3)
                        .add(typeComboBox, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                        .add(customFileLabel)
                        .add(customFileTextField, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                    .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                    .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                        .add(jLabel4)
                        .add(geometryComboBox, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                        .add(customFileNew)
                        .add(customFileBrowse)
                        .add(customFileEdit))
                    .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                    .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                        .add(jLabel5)
                        .add(numberOfContrasts, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                        .add(addContrastsButton)
                        .add(removeContrastsButton))
                    .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED, 112, Short.MAX_VALUE)
                    .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                        .add(importModel, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 35, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                        .add(exportModel, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 32, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                    .addContainerGap())
            );
        }// </editor-fold>//GEN-END:initComponents

    private void importModelActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_importModelActionPerformed
// TODO add your handling code here:
    }//GEN-LAST:event_importModelActionPerformed

    private void customFileBrowseActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_customFileBrowseActionPerformed
// TODO add your handling code here:
    }//GEN-LAST:event_customFileBrowseActionPerformed
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    javax.swing.JButton addContrastsButton;
    javax.swing.JButton customFileBrowse;
    javax.swing.JButton customFileEdit;
    javax.swing.JLabel customFileLabel;
    javax.swing.JButton customFileNew;
    javax.swing.JTextField customFileTextField;
    javax.swing.JButton exportModel;
    javax.swing.JComboBox geometryComboBox;
    javax.swing.JButton importModel;
    javax.swing.JLabel jLabel1;
    javax.swing.JLabel jLabel2;
    javax.swing.JLabel jLabel3;
    javax.swing.JLabel jLabel4;
    javax.swing.JLabel jLabel5;
    javax.swing.JTextField nameTextField;
    javax.swing.JTextField numberOfContrasts;
    javax.swing.JTextField pathTextField;
    javax.swing.JButton removeContrastsButton;
    javax.swing.JComboBox typeComboBox;
    // End of variables declaration//GEN-END:variables
    
}
