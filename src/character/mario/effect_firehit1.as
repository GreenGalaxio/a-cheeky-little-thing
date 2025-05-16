// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//effect_firehit1

package 
{
    import flash.display.MovieClip;

    public dynamic class effect_firehit1 extends MovieClip 
    {

        public function effect_firehit1()
        {
            addFrameScript(17, this.frame18);
        }

        internal function frame18():*
        {
            stop();
            if (((!(root == null)) && (!(parent == null))))
            {
                parent.removeChild(this);
            };
        }


    }
}//package 

