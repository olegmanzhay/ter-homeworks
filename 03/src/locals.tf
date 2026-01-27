locals{
    ssh-keys = file("~/.ssh/ssh-key-15-12-25.pub")
    vpc = {
        "network_id" = "enp7i560tb28nageq0cc"
        "subnet_ids" = [
            "e9b0le401619ngf4h68n",
            "e2lbar6u8b2ftd7f5hia",
            "b0ca48coorjjq93u36pl",
            "fl8ner8rjsio6rcpcf0h",
        ]
        "subnet_zones" = [
            "ru-central1-a",
            "ru-central1-b",
            "ru-central1-c",
            "ru-central1-d",
        ]
    }
    rc_list = [for number in range(1,100): format("rc%02d", "${number}")]
    
}   


    
 