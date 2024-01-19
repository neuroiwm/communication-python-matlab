classdef SenderUDP < ReceiverUDP

    properties
        sender
    end


    methods
        function self = SenderUDP
        end

        function set_config(self, num_port_send, duration_timeout)
            if nargin < 2
                num_port_send = 5000;
            end

            if nargin < 3
                duration_timeout = 0.05;
            end

            self.config.num_port_send = num_port_send;
            self.config.num_port_send_ = 5012;
            self.config.duration_timeout = duration_timeout;
        end


        function start(self)
            self.sender = udpport("IPV4", ...
                'LocalHost',"127.0.0.1",...
                'LocalPort',self.config.num_port_send_,...                
                'Timeout',self.config.duration_timeout);
        end

        function write(self,data,type_data)
            write(self.sender,data,type_data,"127.0.0.1",self.config.num_port_send);
            %"127.0.0.1",self.config.num_port_send);
        end

    end


end