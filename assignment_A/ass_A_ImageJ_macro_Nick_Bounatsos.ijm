# Add the hotkey "q" to the macro
macro "KymoResliceWide Automation [q]" {

    # Add the ROI to the ROI Manager
    roiManager("Add");

    # Count the total number of samples that exist in the ROI Manager
    n = roiManager("count");

    # Initialize a variable to keep track of the highest ROI number
    highest = 0;
    for (i=0; i<n; i++) {

        # Select the ROI
        roiManager("Select", i);

        # Get the name of the selected ROI
        name = Roi.getName();

        # Get the number from the ROI name
        number = parseInt(name.substring(4));

        # Check if the number is higher than the current highest
        if (number > highest) {
            highest = number;
        }
    }

    # Select the last ROI in the ROI Manager
    roiManager("Select", n-1);

    # Generate the name for the current ROI
    roiManager("Rename", "ROI_" + (highest + 1));

    # Rename the selected ROI with the new name
    name = "ROI_" + (highest + 1);

    # Run the KymoResliceWide plugin with the specified parameters
    run("KymoResliceWide ", "intensity=Maximum");

    # Save the resulting image as a TIFF file with the new name
    saveAs("Tiff", "C:/Users/nikos/tif_files/" + name + ".tif");

    # Close the image
    close();
}