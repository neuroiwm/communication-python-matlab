classdef ReceiverUDP < handle

    properties
        receiver
        config = struct;
        data_recv = [];
    end

    methods (Access = public)
        function self = ReceiverUDP()

        end

        function set_config(self, num_port_receive, duration_timeout)
            if nargin < 2
                num_port_receive = 5000;
            end

            if nargin < 3
                duration_timeout = 0.05;
            end

            self.config.num_port_receive = num_port_receive;
            self.config.duration_timeout = duration_timeout;
        end


        function start(self)
            self.receiver = udpport("IPV4", ...
                'LocalHost',"127.0.0.1", ...
                'LocalPort',self.config.num_port_receive, ...
                'Timeout',self.config.duration_timeout);
        end

        function read(self)
            data_recv = self.receiver.read(2,"string");
            if ~isempty(data_recv)
                if isstring(data_recv)
                    self.data_recv = data_recv;
                else
                    self.data_recv = str2num(data_recv);
                end
            end
        end

        function data_recv = get_data_recv(self)
            data_recv = self.data_recv;
        end
    end

end