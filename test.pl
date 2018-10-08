use integer;
$option=@ARGV[0];
$argvsize=@ARGV;
print($argvsize);
if ($option eq "-n"  and $argvsize eq 2) {
    print("++++");
    if ($ARGV[1]) {
        $filename=$ARGV[1];
        $count=0;
        open(DATA,"<",$filename) ;
        @linelist=<DATA>;
        foreach $eachline(@linelist){
            $count=$count+1;

        }
        print("Number of partitions: ", $count);
        close(DATA);
    }
    else{
        print("No partitions found");
    }
}
elsif($option eq "-u" and $argvsize eq 2)
{

    if ($ARGV[1]) {
        $filename=$ARGV[1];
        $used_space=0;
        open(DATA,"<",$filename) ;
        @linelist=<DATA>;
        foreach $eachline(@linelist){
            @tmp=split(/\s+/,$eachline);

            $used_space=$used_space+@tmp[3];
        }
        print("Used space:",$used_space);
       # print("Number of partitions: ", $count);
        close(DATA);
    }
    else{
        print("No partitions found");
    }

}
elsif($option eq "-f" and $argvsize eq 2)
{
    if ($ARGV[1]) {
        $filename=$ARGV[1];
        $free_space=0;
        open(DATA,"<",$filename) ;
        @linelist=<DATA>;
        foreach $eachline(@linelist){
            @tmp=split(/\s+/,$eachline);

            $free_space=$free_space+(@tmp[2]-@tmp[3]);
        }
        print("Free space:",$free_space);
        # print("Number of partitions: ", $count);
        close(DATA);
    }
    else{
        print("No partitions found");
    }

}
elsif($option eq "-t"  and $argv eq 3)
{
    if ($ARGV[2]) {
        $filename=$ARGV[2];
        $type=$ARGV[1];
        @data=();
        open(DATA,"<",$filename) ;
        @linelist=<DATA>;
        foreach $eachline(@linelist){
            @tmp=split(/\s+/,$eachline);

           if(@tmp[1] eq $type)
           {
               push(@data,@tmp[0]);
           }
            $size=@data;
            if($size eq 0)
            {
                print("No mount points with this filesystem type ");
            }
            else{
                foreach $eachdata(@data)
                {
                    print($eachdata,"\n");
                }
            }


        }


        close(DATA);
    }
    else{
        print("No partitions found");
    }
}
elsif($option eq "-s" and $argv eq 2)
{

    if ($ARGV[1]) {
        $name="zlw";
        $student_id="12713513";
        $date="10/10/2018";
        print("Name: ",$name,"\n");
        print("Student ID: ",$student_id,"\n");
        print("Date of completion: ",$date,"\n");
    }
    else{
        print("No partitions found");
    }
}


else{
    print("partitionbrowser.pl ");
    foreach(@ARGV)
    {

        print($_," ");
    }
}

