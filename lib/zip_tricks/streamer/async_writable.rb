# Gets yielded from the writing methods of the CompressingStreamer
# and accepts the data being written into the ZIP. Executes given callbacks
# when done.
class ZipTricks::Streamer::AsyncWritable < ZipTricks::Streamer::Writable
  # Initializes a new Writable with the object it delegates the writes to.
  # Normally you would not need to use this method directly
  def initialize(writer)
    @writer = writer
    @done = []
  end

  # Store a callback to be executed when writting is done.
  #
  def on_done &block
    @done << block
  end

  # Execute all on_done callbacks.
  #
  def on_done
    @done.each &:call
  end
end
