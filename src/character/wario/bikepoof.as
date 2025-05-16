// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bikepoof

package 
{
    import flash.display.MovieClip;

    public dynamic class bikepoof extends MovieClip 
    {

        public function bikepoof()
        {
            addFrameScript(9, this.frame10);
        }

        internal function frame10():*
        {
            stop();
            if (parent != null)
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

