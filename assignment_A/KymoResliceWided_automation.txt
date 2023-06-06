macro "KymoResliceWide Automation" {
	roiManager("Add");
	n = roiManager("count");
	highest = 0;
    for (i=0; i<n; i++) {
        roiManager("Select", i);
        name = Roi.getName();
        number = parseInt(name.substring(4));
        if (number > highest) {
            highest = number;
        }
    }
	roiManager("Select", n-1);
    roiManager("Rename", "ROI_" + (highest + 1));
    name = "ROI_" + (highest + 1);
    run("KymoResliceWide ", "intensity=Maximum");
    saveAs("Tiff", "C:/Users/nikos/tif_files/" + name + ".tif");
    close();
}