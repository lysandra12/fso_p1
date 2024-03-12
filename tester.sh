#! /bin/bash

valid_file=valid_file
invalid_file=test	# Should not exist
valid_dir=valid_dir
invalid_dir=test_dir	# Should not exist
empty_dir=empty_dir
tar_name=tar.tgz

if [ -f "$tar_name" ]
then
	rm $tar_name
fi

# First lets test error input
echo "---TESTER: CHECKING WITH WRONG INPUTS:---"
./Copia 			# "Error: Enter arguments."
./Copia -D			# "Error: Flag without files."
./Copia -K			# "Error: Flag without files."
./Copia -D $tar_name		# "Error: No files to make a copy."
./Copia -D -K			# "Error: Flags without files."
./Copia -K -D			# "Error: Flags without files."
./Copia tar			# "Error: Last file should have the extension .tgz or .tar.gz"
./Copia tar.tg			# Same as above.
./Copia -D -K tar		# Same as above.
./Copia -K -D $tar_name		# "Error: No files to make a copy."

echo ""
echo "---TESTER: CHECKING WITH ONE VALID FILE:---"
# Make a copy of a valid file.
# Start with a dry run:
./Copia -D $valid_file $tar_name		# "Creating tar.tgz \n ->File 'test' exists. Adding it to 'tar.tgz'."
./Copia $valid_file $tar_name		# nothing to output
tar -tf $tar_name			# "$valid_file"

rm $tar_name

echo ""
echo "---TESTER: CHECKING WITH ONE INVALID FILE:---"
# Make a copy of an invalid file.
# Start with a dry run:
./Copia -D $invalid_file $tar_name
./Copia $invalid_file $tar_name
if [ ! -f "$tar_name" ]
then
	echo "Tester: (OK) $tar_name not created because files were not valid."
else
	echo "Tester: (ERROR) $tar_name created with invalid files."
	rm $tar_name
fi

echo ""
echo "---TESTER: CHECKING WITH ONE VALID FILE AND FLAG -K---"
# Make a copy of a valid_file with flag -K
./Copia $valid_file $tar_name
./Copia -D -K $valid_file $tar_name
./Copia -K $valid_file $tar_name
tar -tf $tar_name

rm $tar_name

echo ""
echo "---TESTER: CHECKING WITH ONE INVALID FILE AND FLAG -K---"
./Copia -D -K $invalid_file $tar_name
./Copia -K $invalid_file $tar_name
if [ ! -f "$tar_name" ]
then
	echo "Tester: (OK) $tar_name not created because files were not valid."
else
	echo "Tester: (ERROR) $tar_name created with invalid files."
	rm $tar_name
fi

echo ""
echo "---TESTER: CHECKING WITH VALID DIR (ONE FILE INSIDE)---"
./Copia -

echo ""
echo "---TESTER: CHECKING WITH EMPTY DIR---"

echo ""
echo "---TESTER: CHECKING WITH INVALID DIR---"

echo ""
echo "---TESTER: CHECKING WITH VALID DIR AND FLAG -K (ONE FILE INSIDE)---"

echo ""
echo "---TESTER: CHECKING WITH EMPTY DIR AND FLAG -K---"

echo ""
echo "---TESTER: CHECKING WITH INVALID DIR AND FLAG -K---"

echo ""
echo "---TESTER: CHECKING WITH VALID DIR AND VALID FILE---"

echo ""
echo "---TESTER: CHECKING WITH VALID DIR AND INVALID FILE---"

echo ""
echo "---TESTER: CHECKING WITH INVALID DIR AND VALID FILE---"

echo ""
echo "---TESTER: CHECKING WITH INVALID DIR AND INVALID FILE---"

echo ""
echo "---TESTER: CHECKING WITH VALID DIR AND VALID FILE AND FLAG -K---"

echo ""
echo "---TESTER: CHECKING WITH VALID DIR AND INVALID FILE AND FLAG -K---"

echo ""
echo "---TESTER: CHECKING WITH INVALID DIR AND VALID FILE AND FLAG -K---"

echo ""
echo "---TESTER: CHECKING WITH INVALID DIR AND INVALID FILE AND FLAG -K---"

echo ""
echo "---TESTER: CHECKING WEIRD FILES AND DIR BEHAVIOUR---"
