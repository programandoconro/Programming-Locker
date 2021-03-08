#!/usr/bin/python3

import argparse

def get_args():
    
    parser = argparse.ArgumentParser(description='')
    
    parser.add_argument('-lb', '--local_broker_IP', type=str, help='ip address of the local broker', required=True)
    parser.add_argument('-rb', '--remote_broker_IP', type=str, help='ip address of remote broker', required=True)
    args = parser.parse_args()
    
    local_broker_IP = args.local_broker_IP
    remote_broker_IP = args.remote_broker_IP
    
    return local_broker_IP, remote_broker_IP

local_broker_IP, remote_broker_IP  = get_args()

print ("\n local broker ip: [ %s ]\n" % local_broker_IP)
print ("\n remote broker ip: [ %s ]\n" % remote_broker_IP)



# USE: python3 parse_ip -lb 192.192.192.192 -rb 19.19.19.19
