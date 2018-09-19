Facter.add('is_puppetmaster') do
  setcode do
    Facter::Core::Execution.exec('/bin/hostname')
  end
end
