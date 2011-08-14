package org.videolan.vlc.android;
import org.videolan.vlc.android.IAudioServiceCallback;

interface IAudioService {
	void play();
	void pause();
	void stop();
	void next();
	void previous();
	void setTime(long time);
	String getCurrentMediaPath();
	void load(in List<String> mediaPathList, int position);
	boolean isPlaying();
	boolean hasMedia();
	String getTitle();
	String getArtist();
	int getTime();
	int getLength();
	void addAudioCallback(IAudioServiceCallback cb);
	void removeAudioCallback(IAudioServiceCallback cb);
}