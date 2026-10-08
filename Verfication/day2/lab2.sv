module lab2 (
);

    int arr [9:0];
    int sum, in, in_q4;
    logic [7:0] in_q3;
    task q1 (input int arr [9:0], output int sum);
        for (int i = 0; i < 10 ; i++ ) begin
            sum= sum + arr[i];
        end
    endtask

    function int q2 (input int in_f);
        int result, in;
        in = in_f;
        result =1;
        while (in > 0) begin
            result = result * in;
            in--;
        end
        return result;
    endfunction

    function logic [7:0] q3 (input logic [7:0] in);
        foreach (in[i]) begin 
            q3[7-i] = in[i];
        end
        $display("the reverse of %8b, is %8b", in, q3);
        return 1;
    endfunction

    function int q4(input logic [31:0] in_q4);
        int i;
        i = 32;
        do begin 
            if (in_q4[i])
                q4++;
            else
                q4=q4;
            i--;
        end while(i >= 0);
    endfunction

    int ran_arr [32];

    int queue[$];
    int even, odd, neg;

    int result;
    int arr_search[127:0];

    task search(input int element, input int arr [127:0], output int result);
        foreach (arr[i])begin 
            if (arr[i] == element)begin
                $display("the first match for %0d is %0d found at index %0d",element, arr[i], i);
                result = i;
                break;
            end
            else begin 
                result = -1;
            end
        end
    endtask

    task bin_search(input int element, input int arr [127:0], output int result);
            int N;
            for(N =128; N < 2; ) begin 
                if (arr[(N/2)] == element)begin
                    $display("the first match for %0d is %0d found at index %0d",element, arr[(N/2)], (N/2));
                    result = (N/2);
                end else if (arr[(N/2)] < element) begin 
                    if (arr[(N/2) + (N/4)] == element) begin 
                    $display("the first match for %0d is %0d found at index %0d",element, arr[(N/2) + (N/4)], (N/2) + (N/4));
                    result = (N/2) + (N/4);
                    end
                end else begin 
                    if (arr[(N/4)] == element) begin 
                    $display("the first match for %0d is %0d found at index %0d",element, arr[(N/4)], (N/4));
                    result = (N/4);
                    end
                    else 
                        result = -1;
                end
                N = N/2;
            end
    endtask

    initial begin
        arr = '{0,1,2,3,4,5,6,7,8,9};
        $display("arr = %p", arr);
        q1(arr, sum);
        $display("sum = 0d%0d", sum);
        in = 4;
        $display("factorial of %0d is %0d", in, q2(in));

        in_q3 = 8'b00001111;
        q3(in_q3);

        in_q4 = 3;
        $display("the number of 1's in %0b, is %0d", in_q4, q4(in_q4));

        foreach (ran_arr[i]) begin 
            ran_arr [i] = $urandom_range(1,10);
        end

        $display("the max value is %0p and the min value is %0p", ran_arr.max, ran_arr.min);

        for (int i =0; i <15; i++) begin 
            queue.push_back($random);
        end
        foreach (queue[i]) begin 
            if (queue[i][0])
                odd++;
            else 
                even++;
            if (queue[i][31])
                neg++;
        end
        $display("the number of odd is %0d, even is %0d and neg is %0d", odd, even, neg);

        foreach (arr_search[i])
            arr_search[i] = $urandom_range(1,10);
        bin_search(4, arr_search, result);
        $display("search result is %0d", result);
    end
endmodule