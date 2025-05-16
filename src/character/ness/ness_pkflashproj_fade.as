// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_pkflashproj_fade

package 
{
    import flash.display.MovieClip;

    public dynamic class ness_pkflashproj_fade extends MovieClip 
    {

        public function ness_pkflashproj_fade()
        {
            addFrameScript(20, this.frame21);
        }

        internal function frame21():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

