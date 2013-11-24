class Jekyll::Site
      alias :original_site_payload :site_payload

      def site_payload
              data = original_site_payload

              month_index = {}
              year_index  = []
              post_count  = []

              posts.reverse.each do |post|
                y = post.date.year
                m = "%02d" % post.date.month.to_i

                if month_index[y].nil?
                  year_index << y
                  post_count[y] = {}
                  month_index[y] = []
                end

                month_index[y] << m unless month_index[y].include? m
                post_count[y][m] ||= 0
                post_count[y][m] += 1
              end

              data['site']['month_index'] = month_index
              data['site']['year_index']  = year_index
              data['site']['post_count']  = post_count
              data
      end
end