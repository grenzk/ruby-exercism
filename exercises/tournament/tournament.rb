# frozen_string_literal: true

class Tournament
  TEAM_DATA = [
    { team: 'Devastating Donkeys', mp: 0, w: 0, d: 0, l: 0, p: 0 },
    { team: 'Allegoric Alaskans', mp: 0, w: 0, d: 0, l: 0, p: 0 },
    { team: 'Blithering Badgers', mp: 0, w: 0, d: 0, l: 0, p: 0 },
    { team: 'Courageous Californians', mp: 0, w: 0, d: 0, l: 0, p: 0 }
  ].freeze

  POINTS = { w: 3, d: 1, l: 0 }.freeze

  def self.tally(input)
    return "Team                           | MP |  W |  D |  L |  P\n" if input.chomp.empty?

    teams = deep_copy(TEAM_DATA)
    process_matches(input, teams)
    sorted_teams = sort_teams(teams)
    generate_table(sorted_teams)
  end

  def self.deep_copy(data)
    Marshal.load(Marshal.dump(data))
  end

  def self.process_matches(input, teams)
    input.each_line do |line|
      first_team, second_team, result = line.chomp.split(';')
      first_team_data = find_team_data(teams, first_team)
      second_team_data = find_team_data(teams, second_team)

      first_team_data[:mp] += 1
      second_team_data[:mp] += 1

      case result
      when 'win'
        update_score(first_team_data, second_team_data, :w, :l)
      when 'loss'
        update_score(first_team_data, second_team_data, :l, :w)
      when 'draw'
        update_score(first_team_data, second_team_data, :d, :d)
      end
    end
  end

  def self.update_score(team1, team2, team1_result, team2_result)
    team1[team1_result] += 1
    team1[:p] += POINTS[team1_result]
    team2[team2_result] += 1
    team2[:p] += POINTS[team2_result]
  end

  def self.find_team_data(teams, team_name)
    teams.find { |data| data[:team] == team_name }
  end

  def self.sort_teams(teams)
    teams
      .select { |data| data[:mp].positive? }
      .sort_by { |data| [-data[:p], data[:team]] }
  end

  def self.generate_table(teams)
    table =
      teams.map do |data|
        format(
          "%<team>-30s | %<mp>2d | %<w>2d | %<d>2d | %<l>2d | %<p>2d\n",
          team: data[:team],
          mp: data[:mp],
          w: data[:w],
          d: data[:d],
          l: data[:l],
          p: data[:p]
        )
      end

    "Team                           | MP |  W |  D |  L |  P\n#{table.join}"
  end
end
